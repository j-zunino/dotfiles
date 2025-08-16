{
    pkgs,
    lib,
    config,
    ...
}: let
    color = config.lib.stylix.colors;

    inherit
        (color)
        base00
        base01
        base02
        base03
        base04
        base05
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        ;

    hex = c: "#${c}";
    rgb = c: "rgb(${c})";

    colors = {
        bg0 = lib.mkForce (rgb base00);
        bg1 = lib.mkForce (rgb base01);
        bg2 = lib.mkForce (rgb base02);
        gray1 = lib.mkForce (rgb base03);
        gray2 = lib.mkForce (rgb base04);
        fg = lib.mkForce (rgb base05);
        red = lib.mkForce (rgb base08);
        orange = lib.mkForce (rgb base09);
        yellow = lib.mkForce (rgb base0A);
        green = lib.mkForce (rgb base0B);
        aqua = lib.mkForce (rgb base0C);
        blue = lib.mkForce (rgb base0D);
        purple = lib.mkForce (rgb base0E);

        bg0-hex = hex base00;
        bg1-hex = hex base01;
        bg2-hex = hex base02;
        gray1-hex = hex base03;
        gray2-hex = hex base04;
        fg-hex = hex base05;
        red-hex = hex base08;
        orange-hex = hex base09;
        yellow-hex = hex base0A;
        green-hex = hex base0B;
        aqua-hex = hex base0C;
        blue-hex = hex base0D;
        purple-hex = hex base0E;

        accent = lib.mkForce (rgb base0B);
        accent-hex = hex base0B;
    };
in
    with colors; {
        programs.rofi.theme = lib.mkForce (builtins.toFile "rofi-theme.rasi" ''
            * {
                background-color: transparent;
                text-color: ${fg-hex};
                margin: 0;
                padding: 0;
            }

            window {
                width: 50%;
                padding: 10px 4px;
                background-color: ${bg0-hex};
            }

            #mainbox {
                border: 1px;
                border-color: ${gray1-hex};
                padding: 8px 4px;
            }

            inputbar {
                spacing: 4px;
                padding: 2px 0 10px 0;
                background-color: ${bg0-hex};
                border: 0 0 1px 0;
                border-color: ${gray1-hex};
            }

            prompt, entry, element-icon, element-text {
                vertical-align: 0.5;
            }

            prompt {
                text-color: ${accent-hex};
            }

            textbox {
                border: 1px;
                padding: 10px 4px;
                border-color: ${gray1-hex};
            }

            listview {
                padding: 10px 0 2px 0;
                columns: 1;
                fixed-height: false;
            }

            element {
                padding: 2px 8px;
                spacing: 4px;
            }

            element normal {
                text-color: ${fg-hex};
            }

            element urgent {
                text-color: ${yellow-hex};
            }

            element active,
            element alternate.active {
                text-color: ${accent-hex};
            }

            element selected {
                text-color: ${fg-hex};
            }

            element.selected.normal,
            element.selected.active {
                background-color: ${accent-hex}33;
            }

            element.selected.urgent {
                background-color: ${yellow-hex};
            }

            element-icon {
                size: 1em;
            }

            element-text {
                text-color: inherit;
                highlight: bold ${accent-hex};
            }
        '');
    }
