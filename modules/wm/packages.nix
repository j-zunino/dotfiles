{...}: {
    flake.modules.homeManager.wm-pkgs = {pkgs, ...}: {
        home.packages = with pkgs; [
            brightnessctl
            wl-clipboard
            playerctl
            cliphist
            wbg
        ];
    };
}
