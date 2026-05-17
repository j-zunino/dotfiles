{...}: {
    flake.modules.homeManager.wm-pkgs = {pkgs, ...}: {
        home.packages = with pkgs; [
            brightnessctl
            wl-clipboard
            hyprpicker
            playerctl
            cliphist
            wbg
        ];
    };
}
