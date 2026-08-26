{inputs, ...}: let
    version = "1.18.23";
in {
    flake.overlays.opencode-baseline = final: prev: {
        opencode-baseline = final.stdenv.mkDerivation {
            pname = "opencode-baseline";
            inherit version;

            src = final.fetchzip {
                url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-linux-x64-baseline.tar.gz";
                hash = "sha256-tcghrzZbMWvcbkkmESu+OE+LHeTS9iSJPY8m3Vm3aaI=";
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

    flake.modules.homeManager.opencode = {pkgs, ...}: {
        home.packages = [pkgs.opencode];
    };

    flake.modules.homeManager.opencode-baseline = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.self.overlays.opencode-baseline];
        home.packages = [pkgs.opencode-baseline];
    };

    flake.modules.homeManager.llm = {pkgs, ...}: {
        home.packages = with pkgs; [
            antigravity-cli
            grok-build
            t3code
            codex

            handy
            wtype
        ];
    };
}
