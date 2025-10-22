{pkgs, ...}: {
    programs.mpv = {
        enable = true;
        package = (
            pkgs.mpv-unwrapped.wrapper {
                scripts = with pkgs.mpvScripts; [modernx];
                mpv = pkgs.mpv-unwrapped.override {
                    waylandSupport = true;
                };
            }
        );
    };
}
