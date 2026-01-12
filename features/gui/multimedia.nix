{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gui.multimedia {
        programs.mpv = {
            enable = true;
            package = (
                pkgs.mpv.override {
                    scripts = with pkgs.mpvScripts; [modernx];
                }
            );
        };
    };
}
