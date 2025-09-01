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
                package = pkgs.nerd-fonts.iosevka-term;
                name = "IosevkaTerm Nerd Font";
            };
            sansSerif = {
                package = pkgs.inter;
                name = "Noto Sans";
            };
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };

            sizes = {
                terminal = 17;
                applications = 12;
                desktop = 12;
                popups = 12;
            };
        };
    };
}
