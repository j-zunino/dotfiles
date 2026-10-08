{inputs, ...}: let
    nuvio-version = "0.1.29-alpha";
in {
    flake.overlays.nuvio = final: prev: let
        src = final.fetchurl {
            url = "https://github.com/NuvioMedia/NuvioDesktop/releases/download/${nuvio-version}/Nuvio-Linux-x86_64-${nuvio-version}.AppImage";
            hash = "sha256-rQoMR+tWVqu0VHA2G7Oj39HwuzxO+KP3snJYyW87GsI=";
        };
        appimageContents = final.appimageTools.extract {
            pname = "nuvio";
            version = nuvio-version;
            inherit src;
        };
    in {
        nuvio = final.appimageTools.wrapType2 {
            pname = "nuvio";
            version = nuvio-version;
            inherit src;

            extraInstallCommands = ''
                mkdir -p $out/share/applications $out/share/icons/hicolor/256x256/apps
                cp ${appimageContents}/Nuvio.desktop $out/share/applications/nuvio.desktop
                cp ${appimageContents}/Nuvio.png $out/share/icons/hicolor/256x256/apps/nuvio.png
                substituteInPlace $out/share/applications/nuvio.desktop \
                    --replace 'Exec=AppRun' 'Exec=nuvio' \
                    --replace 'Icon=Nuvio' 'Icon=nuvio'
            '';

            meta = {
                description = "Free, open-source media app (Nuvio Desktop)";
                homepage = "https://github.com/NuvioMedia/NuvioDesktop";
                mainProgram = "nuvio";
            };
        };
    };

    flake.modules.homeManager.mpv = {pkgs, ...}: {
        programs.mpv = {
            enable = true;
            package = pkgs.mpv.override {
                scripts = with pkgs.mpvScripts; [modernz];
            };
        };
    };

    flake.modules.homeManager.imv = {
        programs.imv.enable = true;
    };

    flake.modules.homeManager.nuvio = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.self.overlays.nuvio];
        home.packages = [pkgs.nuvio];
    };
}
