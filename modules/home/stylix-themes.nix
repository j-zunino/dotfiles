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
        grey1 = lib.mkForce (rgb base03);
        grey2 = lib.mkForce (rgb base04);
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
        grey1-hex = hex base03;
        grey2-hex = hex base04;
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
        stylix.targets = {
            waybar.enable = false;
            neovim.enable = false;
            yazi.enable = false;
        };

        stylix.iconTheme = {
            enable = true;
            package = pkgs.reversal-icon-theme;
            light = "Reversal";
            dark = "Reversal";
        };

        wayland.windowManager.hyprland.settings.general = {
            "col.active_border" = accent;
            "col.inactive_border" = bg1;
        };

        programs.waybar = {
            settings.mainBar."clock#date".calendar.format = {
                months = "<span color='${accent-hex}'><b>{}</b></span>";
                days = "<span color='${fg-hex}'><b>{}</b></span>";
                weeks = "<span color='${bg2-hex}'><b>W{}</b></span>";
                weekdays = "<span color='${grey1-hex}'><b>{}</b></span>";
                today = "<span color='${red-hex}'><b><u>{}</u></b></span>";
            };

            style = lib.mkAfter ''
                window#waybar {
                  background: ${bg1-hex};
                  color: ${grey1-hex};
                }

                tooltip {
                  background: ${bg1-hex};
                  border-color: ${accent-hex};
                }

                tooltip label {
                  color: ${fg-hex};
                }

                #custom-nix-logo {
                  background: ${accent-hex};
                  color: ${bg0-hex};
                }
                #custom-nix-logo:hover {
                  color: ${bg1-hex};
                }

                #workspaces button {
                  color: ${grey1-hex};
                }

                #workspaces button.active {
                  color: ${accent-hex};
                }

                #window {
                  background: ${bg1-hex};
                }

                #clock.date {
                  color: ${grey2-hex};
                }

                #cpu.warning,
                #memory.warning,
                #battery.warning {
                  color: ${yellow-hex};
                }

                #cpu.critical,
                #memory.critical,
                #battery.critical,
                #temperature.critical {
                  color: ${red-hex};
                }

                #battery.charging {
                  color: ${accent-hex};
                }

                #custom-arrow {
                  background: ${bg1-hex};
                  color: ${accent-hex};
                }


                #cpu:hover,
                #memory:hover,
                #window:hover,
                #network:hover,
                #battery:hover,
                #backlight:hover,
                #pulseaudio:hover,
                #clock.date:hover,
                #temperature:hover,
                #custom-expand:hover,
                #workspaces button:hover {
                  background: none;
                  color: ${fg-hex};
                }

                #custom-separator {
                  color: ${bg2-hex};
                }

                #cpu,
                #memory,
                #window,
                #battery,
                #network,
                #backlight,
                #pulseaudio,
                #temperature,
                #custom-expand,
                #workspaces button {
                  color: ${grey1-hex};
                }
            '';
        };

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
                border-color: ${grey1-hex};
                padding: 8px 4px;
            }

            inputbar {
                spacing: 4px;
                padding: 2px 0 10px 0;
                background-color: ${bg0-hex};
                border: 0 0 1px 0;
                border-color: ${grey1-hex};
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
                border-color: ${grey1-hex};
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

        xdg.configFile."zellij/layouts/default.kdl".text = ''
            layout {
                pane split_direction="vertical" {
                    pane
                }

                pane size=1 borderless=true {
                    plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
                        format_left "#[bg=${bg1-hex}]{mode}{tabs}"
                        format_right "#[bg=${bg1-hex},fg=${grey1-hex}]{session} | {datetime}"
                        format_space "#[bg=${bg1-hex}]"

                        mode_normal "#[bg=${accent-hex},fg=${bg0-hex},bold] NORMAL #[bg=${bg1-hex},fg=${accent-hex}]"
                        mode_locked  "#[bg=${red-hex},fg=${bg0-hex},bold] LOCKED #[bg=${bg1-hex},fg=${red-hex}]"
                        mode_scroll  "#[bg=${aqua-hex},fg=${bg0-hex},bold] SCROLL #[bg=${bg1-hex},fg=${aqua-hex}]"
                        mode_session "#[bg=${purple-hex},fg=${bg0-hex},bold] SESSION #[bg=${bg1-hex},fg=${purple-hex}]"

                        tab_normal "#[bg=${bg1-hex},fg=${grey1-hex}] {index}: {name} {fullscreen_indicator}{sync_indicator}{floating_indicator}"
                        tab_active "#[bg=${bg1-hex},fg=${accent-hex},bold] {index}: {name} {fullscreen_indicator}{sync_indicator}{floating_indicator}"
                        tab_fullscreen_indicator "󰊓"
                        tab_sync_indicator "󰓦"
                        tab_floating_indicator "󰉈"

                        datetime "#[bg=${bg1-hex},fg=${grey1-hex}]{format} "
                        datetime_format "%A, %d %b %Y %H:%M"
                        datetime_timezone "America/Argentina/Buenos_Aires"
                    }
                }
            }
        '';

        programs.yazi.theme = {
            manager = {
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
                    fg = grey1-hex;
                    bg = grey1-hex;
                };
                marker_selected = {
                    fg = grey2-hex;
                    bg = grey2-hex;
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
                    fg = grey1-hex;
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
                    bg = grey2-hex;
                };

                border_style = {fg = grey1-hex;};
            };

            mode = {
                normal_main = {
                    fg = bg0-hex;
                    bg = accent-hex;
                    bold = true;
                };
                normal_alt = {
                    fg = grey1-hex;
                    bg = bg1-hex;
                };

                select_main = {
                    fg = bg0-hex;
                    bg = red-hex;
                    bold = true;
                };
                select_alt = {
                    fg = grey1-hex;
                    bg = bg1-hex;
                };
                unset_main = {
                    fg = bg0-hex;
                    bg = purple-hex;
                    bold = true;
                };
                unset_alt = {
                    fg = grey1-hex;
                    bg = bg1-hex;
                };
            };

            status = {
                perm_type = {fg = blue-hex;};
                perm_read = {fg = yellow-hex;};
                perm_write = {fg = red-hex;};
                perm_exec = {fg = green-hex;};
                perm_sep = {fg = grey1-hex;};

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
                    fg = grey1-hex;
                };
                title = {
                    fg = grey1-hex;
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
