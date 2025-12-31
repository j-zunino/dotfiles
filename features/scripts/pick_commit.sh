#!/usr/bin/env bash
set -euo pipefail

prompt=$(
    cat <<'EOF'
Instructions:
Suggest 10 commit messages based on the following diff:

--- START DIFF ---
EOF
)

prompt+=$(git diff --cached)

prompt+=$(
    cat <<'EOF'

--- END DIFF ---

Rules:
1. Format: <type>(<scope>): <description> — using Conventional Commits.
2. Focus on purpose and impact.
3. Each message must be <70 characters and lowercase.
4. Each message must cover a different perspective or benefit.
5. Easily understood by someone unfamiliar with the codebase.

Goal:
Provide a wide range of expressive, valid, and relevant commit messages.

Output format:
only raw commit messages, lowercase, one per line.
EOF
)

selected_message=$(aichat "$prompt" | fzf || true)

if [[ -z $selected_message ]]; then
    echo "No message selected, commit aborted."
    exit 0
fi

COMMIT_MSG_FILE=$(mktemp)
echo "$selected_message" >"$COMMIT_MSG_FILE"
nvim "$COMMIT_MSG_FILE"

if [[ -s $COMMIT_MSG_FILE ]]; then
    git commit -F "$COMMIT_MSG_FILE"
else
    echo "Commit message is empty, commit aborted."
fi

rm -f "$COMMIT_MSG_FILE"
