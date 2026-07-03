{inputs, ...}: let
    version = "1.17.13";
in {
    flake.overlays.opencode-baseline = final: prev: {
        opencode-baseline = final.stdenv.mkDerivation {
            pname = "opencode-baseline";
            inherit version;

            src = final.fetchzip {
                url = "https://github.com/anomalyco/opencode/releases/download/v${version}/opencode-linux-x64-baseline.tar.gz";
                hash = "sha256-LPWOqWpLjkJY8Ji9ZBP5D7VULMTy/3pYHe+LqimmQhA=";
            };

            nativeBuildInputs = [final.autoPatchelfHook];

            buildInputs = [
                final.stdenv.cc.cc
                final.libgcc
                final.glibc
            ];

            dontConfigure = true;
            dontBuild = true;
            dontStrip = true;

            installPhase = ''
                mkdir -p $out/bin
                cp opencode $out/bin/opencode
            '';

            meta.mainProgram = "opencode";
        };
    };

    flake.modules.homeManager.opencode-baseline = {pkgs, ...}: {
        nixpkgs.overlays = [
            inputs.self.overlays.opencode-baseline
        ];

        home.packages = [
            pkgs.opencode-baseline
        ];
    };
}
