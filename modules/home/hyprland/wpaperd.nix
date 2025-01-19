{ lib, ... }:

{
    programs.wpaperd = {
        enable = true;
        settings.any = {
            path = lib.mkForce "/home/juan/dotfiles/modules/home/hyprland/wallpapers";
            duration = "30m";
            mode = lib.mkForce "center";
        };
    };
}

