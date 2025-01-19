{ pkgs, lib, config, ... }:

{
    stylix = {
        enable = true;

        image = ../modules/home/hyprland/wallpapers/rock_2.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

        cursor = {
            package = pkgs.apple-cursor;
            name = "macOS";
            size = 30;
        };

        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };

            sizes = {
                applications = 11;
                terminal = 11;
                desktop = 10;
                popups = 10;
            };
        };
    };
}
