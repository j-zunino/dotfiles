{
    inputs,
    self,
    ...
}: let
    theme = {pkgs, ...}: {
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
                    name = "Inter";
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
    };

    mkColor = color: {
        raw = color;
        hex = "#${color}";
        hexNoPrefix = color;
        rgb = "rgb(${color})";
    };

    mkColors = config: let
        c = config.lib.stylix.colors;
    in {
        bg0 = mkColor c.base00;
        bg1 = mkColor c.base01;
        bg2 = mkColor c.base02;

        gray1 = mkColor c.base03;
        gray2 = mkColor c.base04;

        fg = mkColor c.base05;

        red = mkColor c.base08;
        orange = mkColor c.base09;
        yellow = mkColor c.base0A;
        green = mkColor c.base0B;
        aqua = mkColor c.base0C;
        blue = mkColor c.base0D;
        purple = mkColor c.base0E;

        accent = mkColor c.base0B;
    };
in {
    flake.modules.nixos.stylix = {
        config,
        lib,
        pkgs,
        ...
    }: {
        imports = [
            inputs.stylix.nixosModules.stylix
            (theme {inherit pkgs;})
        ];

        options.my.colors = lib.mkOption {
            type = lib.types.attrs;
            readOnly = true;
        };

        config.my.colors = mkColors config;
    };

    flake.modules.homeManager.stylix = {
        config,
        lib,
        pkgs,
        ...
    }: {
        imports = [
            inputs.stylix.homeModules.stylix
            (theme {inherit pkgs;})
        ];

        options.my.colors = lib.mkOption {
            type = lib.types.attrs;
            readOnly = true;
        };

        config = {
            stylix = {
                targets = {
                    waybar.enable = false;
                    neovim.enable = false;
                    zen-browser.enable = false;
                    fzf.enable = false;
                    spicetify.enable = false;
                    lazygit.enable = false;
                    hyprland.enable = false;
                };

                icons = {
                    enable = true;
                    package = pkgs.papirus-icon-theme;
                    light = "Papirus-Light";
                    dark = "Papirus-Dark";
                };
            };

            my.colors = mkColors config;
        };
    };
}
