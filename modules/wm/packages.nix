{...}: {
    flake.modules.homeManager.wm-pkgs = {pkgs, ...}: {
        home.packages = with pkgs; [
            hyprpolkitagent
            brightnessctl
            wl-clipboard
            hyprpicker
            playerctl
            hyprshot
            cliphist
            wbg
        ];
    };
}
