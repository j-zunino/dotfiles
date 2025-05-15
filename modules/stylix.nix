{pkgs, ...}: {
    stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";

        cursor = {
            package = pkgs.apple-cursor;
            name = "macOS";
            size = 32;
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
