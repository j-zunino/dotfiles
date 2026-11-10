{
    inputs,
    self,
    ...
}: let
    theme = {pkgs, ...}: {
        stylix = {
            enable = true;

            polarity = "dark";
            base16Scheme = {
                base00 = "#151515";
                base01 = "#202020";
                base02 = "#303030";
                base03 = "#505050";
                base04 = "#B0B0B0";
                base05 = "#D0D0D0";
                base06 = "#E0E0E0";
                base07 = "#F5F5F5";
                base08 = "#d36a6b";
                base09 = "#dc8e5d";
                base0A = "#d8a96c";
                base0B = "#9cb56d";
                base0C = "#86c1b9";
                base0D = "#6ea5af";
                base0E = "#c78dae";
                base0F = "#a16946";
            };

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

        options.my = {
            colors = lib.mkOption {
                type = lib.types.attrs;
                readOnly = true;
            };

            wallpaper = lib.mkOption {
                type = lib.types.str;
                default = "classic_dark";
            };
        };

        config = {
            my.colors = mkColors config;

            stylix = {
                targets = {
                    waybar.enable = false;
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

            home.packages = [
                (pkgs.writeShellApplication {
                    name = "random-wallpaper";
                    runtimeInputs = [pkgs.wbg pkgs.findutils pkgs.coreutils pkgs.procps];
                    text = ''
                        dir="$HOME/dotfiles/wallpapers/${config.my.wallpaper}"
                        img=$(find "$dir" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

                        pkill -x wbg || true
                        exec wbg -s "$img"
                    '';
                })
            ];
        };
    };
}
