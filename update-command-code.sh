#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLM_NIX="$SCRIPT_DIR/modules/programs/llm.nix"
LOCK_FILE="$SCRIPT_DIR/modules/programs/command-code-lock.json"

VERSION=$(grep 'commandCodeVersion =' "$LLM_NIX" | head -1 | sed 's/.*"\(.*\)".*/\1/')
echo "Current command-code version: $VERSION"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

echo "Downloading command-code $VERSION..."
curl -sL "https://registry.npmjs.org/command-code/-/command-code-${VERSION}.tgz" | tar xz -C "$tmpdir"

echo "Generating lock file..."
cp "$tmpdir/package/package.json" "$tmpdir/"
cp "$LOCK_FILE" "$tmpdir/package/package-lock.json"
cd "$tmpdir/package"
node -e "
const p = require('./package.json');
p.devDependencies && delete p.devDependencies;
p.scripts && delete p.scripts;
require('fs').writeFileSync('package.json', JSON.stringify(p, null, 2));
"
npm install --package-lock-only --ignore-scripts

cp package-lock.json "$LOCK_FILE"
echo "Lock file saved to $LOCK_FILE"

echo "Updating fetchurl hash..."
FETCH_RAW=$(nix-prefetch-url --type sha256 "https://registry.npmjs.org/command-code/-/command-code-${VERSION}.tgz" 2>/dev/null | tail -1)
FETCH_SRI=$(nix hash to-sri --type sha256 "$FETCH_RAW" 2>/dev/null | tail -1)

echo "Updating npmDepsHash..."
NPM_DEPS_HASH=$(nix-shell -p prefetch-npm-deps --run "prefetch-npm-deps '$LOCK_FILE'" 2>/dev/null | tail -1)

[ -n "$FETCH_SRI" ] || { echo "Failed to compute the tarball hash" >&2; exit 1; }
[ -n "$NPM_DEPS_HASH" ] || { echo "Failed to compute npmDepsHash" >&2; exit 1; }

sed -i "/flake.overlays.command-code/,/dontNpmBuild/s|hash = \"sha256-[^\"]*\"|hash = \"$FETCH_SRI\"|" "$LLM_NIX"
sed -i "/flake.overlays.command-code/,/dontNpmBuild/s|npmDepsHash = \"sha256-[^\"]*\"|npmDepsHash = \"$NPM_DEPS_HASH\"|" "$LLM_NIX"

echo "Done. Updated llm.nix with:"
echo "  fetchurl hash: $FETCH_SRI"
echo "  npmDepsHash:   $NPM_DEPS_HASH"
