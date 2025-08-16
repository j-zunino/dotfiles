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
        services.dunst.settings = {
            global = {
                background = bg0;
                foreground = fg;
                frame_color = accent;
            };

            urgency_low.frame_color = lib.mkForce blue-hex;
            urgency_normal.frame_color = lib.mkForce green-hex;
            urgency_critical.frame_color = lib.mkForce red-hex;
        };

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

        programs.yazi.theme = {
            mgr = {
                cwd = {
                    fg = accent-hex;
                };

                hovered = {
                    bg = bg2-hex;
                    bold = true;
                    reversed = false;
                };

                find_keyword = {
                    fg = accent-hex;
                    bold = true;
                    italic = false;
                    underline = false;
                };
                find_position = {
                    fg = red-hex;
                    bold = true;
                    italic = false;
                };

                marker_marked = {
                    fg = gray1-hex;
                    bg = gray1-hex;
                };
                marker_selected = {
                    fg = gray2-hex;
                    bg = gray2-hex;
                };
                marker_copied = {
                    fg = accent-hex;
                    bg = accent-hex;
                };
                marker_cut = {
                    fg = red-hex;
                    bg = red-hex;
                };

                tab_active = {
                    fg = fg-hex;
                    bg = bg1-hex;
                    bold = true;
                    reversed = false;
                };
                tab_inactive = {
                    fg = gray1-hex;
                    bg = bg1-hex;
                };

                count_copied = {
                    fg = bg0-hex;
                    bg = accent-hex;
                };
                count_cut = {
                    fg = bg0-hex;
                    bg = red-hex;
                };
                count_selected = {
                    fg = bg0-hex;
                    bg = gray2-hex;
                };

                border_style = {fg = gray1-hex;};
            };

            mode = {
                normal_main = {
                    fg = bg0-hex;
                    bg = accent-hex;
                    bold = true;
                };
                normal_alt = {
                    fg = gray1-hex;
                    bg = bg1-hex;
                };

                select_main = {
                    fg = bg0-hex;
                    bg = red-hex;
                    bold = true;
                };
                select_alt = {
                    fg = gray1-hex;
                    bg = bg1-hex;
                };
                unset_main = {
                    fg = bg0-hex;
                    bg = purple-hex;
                    bold = true;
                };
                unset_alt = {
                    fg = gray1-hex;
                    bg = bg1-hex;
                };
            };

            status = {
                perm_type = {fg = blue-hex;};
                perm_read = {fg = yellow-hex;};
                perm_write = {fg = red-hex;};
                perm_exec = {fg = green-hex;};
                perm_sep = {fg = gray1-hex;};

                progress_label = {
                    fg = bg0-hex;
                    bold = true;
                };
                progress_normal = {
                    fg = accent-hex;
                    bg = bg0-hex;
                };
                progress_error = {
                    fg = red-hex;
                    bg = bg0-hex;
                };
            };

            confirm = {
                border = {
                    fg = gray1-hex;
                };
                title = {
                    fg = gray1-hex;
                };
                btn_yes = {
                    fg = bg0-hex;
                    bg = green-hex;
                };
                btn_no = {
                    fg = bg0-hex;
                    bg = red-hex;
                };
            };

            input = {
                border = {
                    fg = accent-hex;
                };
                title = {
                    fg = accent-hex;
                };
                selected = {
                    bg = bg2-hex;
                };
            };
        };
    }
