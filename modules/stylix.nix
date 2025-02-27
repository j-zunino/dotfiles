{ pkgs, lib, config, ... }:

{
    stylix = {
        enable = true;

        image = ../modules/home/hyprland/wallpapers/rock_2.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

        iconTheme = {
            enable = true;
            package = pkgs.reversal-icon-theme;
            light = "Reversal";
            dark = "Reversal";
        };

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
                package = pkgs.inter;
                name = "Noto Sans";
                # package = pkgs.nerd-fonts.jetbrains-mono;
                # name = "JetBrainsMono Nerd Font";
            };
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
                # package = pkgs.nerd-fonts.jetbrains-mono;
                # name = "JetBrainsMono Nerd Font";
            };

            sizes = {
                applications = 11;
                terminal = 13;
                desktop = 10;
                popups = 10;
            };
        };
    };
}
