{ pkgs, config, ... }:

{
    programs = {
        rofi = {
            package = pkgs.rofi-wayland;
            enable = true;
            location = "center";
        };
    };
}
