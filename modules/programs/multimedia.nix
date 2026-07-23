{...}: {
    flake.modules.homeManager.stremio = {pkgs, ...}: {
        home.packages = with pkgs; [
            stremio-linux-shell
        ];
    };

    flake.modules.homeManager.mpv = {pkgs, ...}: {
        programs.mpv = {
            enable = true;
            package = pkgs.mpv.override {
                scripts = with pkgs.mpvScripts; [modernz];
            };
        };
    };
}
