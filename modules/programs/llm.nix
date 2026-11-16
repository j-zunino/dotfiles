{inputs, ...}: let
    opencodeBaselineVersion = "1.19.5";
    commandCodeVersion = "1.88.2";
in {
    flake.overlays.opencode-baseline = final: prev: {
        opencode-baseline = final.stdenv.mkDerivation {
            pname = "opencode-baseline";
            version = opencodeBaselineVersion;

            src = final.fetchzip {
                url = "https://github.com/anomalyco/opencode/releases/download/v${opencodeBaselineVersion}/opencode-linux-x64-baseline.tar.gz";
                hash = "sha256-k0rbJrDkkvIqPk+kTSqsqy2XZJphS5pHQf8JYGTTMTQ=";
            };

            nativeBuildInputs = [
                final.autoPatchelfHook
                final.makeBinaryWrapper
            ];

            buildInputs = [
                final.glibc
            ];

            dontConfigure = true;
            dontBuild = true;
            dontStrip = true;

            installPhase = ''
                mkdir -p $out/bin
                cp opencode $out/bin/opencode
                wrapProgram $out/bin/opencode \
                    --set OPENCODE_DISABLE_AUTOUPDATE true
            '';

            meta.mainProgram = "opencode";
        };
    };

    flake.overlays.command-code = final: prev: {
        command-code = final.buildNpmPackage {
            pname = "command-code";
            version = commandCodeVersion;

            src = final.runCommand "command-code-src" {nativeBuildInputs = [final.python3];} ''
                mkdir $out
                tar xzf ${final.fetchurl {
                    url = "https://registry.npmjs.org/command-code/-/command-code-${commandCodeVersion}.tgz";
                    hash = "sha256-7heMx58Nu377LzSHG5q9pyhvCjOc98K7HLnhM5o47ZY=";
                }} -C $out --strip-components=1
                cp ${./command-code-lock.json} $out/package-lock.json
                python3 -c "
                import json, sys
                p = json.load(open(sys.argv[1]))
                p.pop('devDependencies', None)
                p.pop('scripts', None)
                json.dump(p, open(sys.argv[1], 'w'), indent=2)
                " $out/package.json
            '';

            npmDepsHash = "sha256-N8KvmvZoLng+Gooq53kG+6nO8hTPzzPMkZwMIc87exo=";

            dontNpmBuild = true;

            meta.mainProgram = "cmd";
        };
    };

    flake.modules.homeManager.opencode = {pkgs, ...}: {
        home.packages = [pkgs.opencode];
    };

    flake.modules.homeManager.opencode-baseline = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.self.overlays.opencode-baseline];
        home.packages = [pkgs.opencode-baseline];
    };

    flake.modules.homeManager.llm = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.self.overlays.command-code];
        home.packages = with pkgs; [
            antigravity-cli
            codex
            command-code
            grok-build
            t3code

            agent-browser
            handy
            wtype
            paseo
        ];
    };
}
