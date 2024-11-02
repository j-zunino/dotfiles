{ pkgs, ... }:

{
    programs = {
        rofi = {
            package = pkgs.rofi-wayland;
            enable = true;
            font = "JetBrainsMono Nerd Font 11";
        };
    };
}
