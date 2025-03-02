{ pkgs, lib, config, ... }:

let
    bg0 = lib.mkForce "rgb(${config.lib.stylix.colors.base00})";
    bg1 = lib.mkForce "rgb(${config.lib.stylix.colors.base01})";
    bg2 = lib.mkForce "rgb(${config.lib.stylix.colors.base02})";

    grey1 = lib.mkForce "rgb(${config.lib.stylix.colors.base03})";
    grey2 = lib.mkForce "rgb(${config.lib.stylix.colors.base04})";

    fg = lib.mkForce "rgb(${config.lib.stylix.colors.base05})";

    red = lib.mkForce "rgb(${config.lib.stylix.colors.base08})";
    orange = lib.mkForce "rgb(${config.lib.stylix.colors.base09})";
    yellow = lib.mkForce "rgb(${config.lib.stylix.colors.base0A})";
    green = lib.mkForce "rgb(${config.lib.stylix.colors.base0B})";
    aqua = lib.mkForce "rgb(${config.lib.stylix.colors.base0C})";
    blue = lib.mkForce "rgb(${config.lib.stylix.colors.base0D})";
    purple = lib.mkForce "rgb(${config.lib.stylix.colors.base0E})";


    bg0-hex = "#${config.lib.stylix.colors.base00}";
    bg1-hex = "#${config.lib.stylix.colors.base01}";
    bg2-hex = "#${config.lib.stylix.colors.base02}";

    grey1-hex = "#${config.lib.stylix.colors.base03}";
    grey2-hex = "#${config.lib.stylix.colors.base04}";

    fg-hex = "#${config.lib.stylix.colors.base05}";

    red-hex = "#${config.lib.stylix.colors.base08}";
    orange-hex = "#${config.lib.stylix.colors.base09}";
    yellow-hex = "#${config.lib.stylix.colors.base0A}";
    green-hex = "#${config.lib.stylix.colors.base0B}";
    aqua-hex = "#${config.lib.stylix.colors.base0C}";
    blue-hex = "#${config.lib.stylix.colors.base0D}";
    purple-hex = "#${config.lib.stylix.colors.base0E}";


    accent = green;
    accent-hex = green-hex;
in
{
    stylix = {
        targets = {
            waybar.enable = false;
            neovim.enable = false;
        };

        iconTheme = {
            enable = true;
            package = pkgs.reversal-icon-theme;
            light = "Reversal";
            dark = "Reversal";
        };
    };

    wayland.windowManager.hyprland.settings.general = {
        "col.active_border" = accent;
        "col.inactive_border" = bg0;
    };

    programs.waybar = {
        settings = {
            mainBar = {
                "clock#time" = {
                    calendar = {
                        format = {
                            months =     "<span color='${accent-hex}'><b>{}</b></span>";
                            days =       "<span color='${fg-hex}'><b>{}</b></span>";
                            weeks =      "<span color='${bg2-hex}'><b>W{}</b></span>";
                            weekdays =   "<span color='${grey1-hex}'><b>{}</b></span>";
                            today =      "<span color='${red-hex}'><b><u>{}</u></b></span>";
                        };
                    };
                };
            };
        };

        style = lib.mkAfter ''
            window#waybar {
                background: ${bg1-hex};
                color: ${fg-hex};
            }

            /* - [ LEFT ] - */
            #custom-nix-logo {
                background: ${accent-hex};
                color: ${bg0-hex};
            }

            #workspaces {
                background: ${bg2-hex};
            }

            #workspaces button {
                color: ${grey1-hex};
            }

            #workspaces button.active {
                color: ${accent-hex};
                font-weight: bold;
            }

            #workspaces button:hover {
                background: none;
                color: ${fg-hex};
            }

            #window {
                background: ${bg1-hex};
            }

            /* - [ CENTER ] - */
            #clock.day,
            #clock.date {
                background: ${bg2-hex};
                color: ${fg-hex};
            }

            #clock.time {
                background: ${accent-hex};
                color: ${bg0-hex};
            }

            /* - [ RIGHT ] - */
            #tray,
            #memory,
            #cpu {
                background: ${bg1-hex};
            }

            #pulseaudio,
            #backlight,
            #network,
            #battery {
                background: ${bg2-hex};
            }

            #battery.charging {
                color: ${accent-hex};
            }

            #cpu.warning, #memory.warning, #battery.warning {
                color: ${yellow-hex};
            }

            #cpu.critical, #memory.critical, #battery.critical {
                color: ${red-hex};
            }

            #custom-poweroff {
                background: ${accent-hex};
                color: ${bg0-hex};
            }

            tooltip {
                background: ${bg0-hex};
                border: 2px solid ${accent-hex};
            }

            tooltip label {
                color: ${fg-hex};
            }

            /* - [ Arrows accent ] - */
            #custom-arrow-l-1,
            #custom-arrow-r-3,
            #custom-arrow-c-2,
            #custom-arrow-c-3 {
                background: ${bg2-hex};
                color: ${accent-hex};
            }


            /* - [ Arrows gray ] - */
            #custom-arrow-l-2,
            #custom-arrow-r-1,
            #custom-arrow-r-2,
            #custom-arrow-c-1,
            #custom-arrow-c-4 {
                background: ${bg1-hex};
                color: ${bg2-hex};
            }
        '';
    };

    services.dunst.settings = {
        global = {
            background = bg0;
            foreground = fg;
            frame_color = accent;
        };

        urgency_low = {
            frame_color = lib.mkForce blue-hex;
        };

        urgency_normal = {
            frame_color = lib.mkForce green-hex;
        };

        urgency_critical = {
            frame_color = lib.mkForce red-hex;
        };
    };

    programs.rofi.theme = lib.mkForce (builtins.toFile "rofi-theme.rasi" ''
        * {
            bg0: ${bg0-hex};
            bg1: ${bg1-hex};
            fg: ${fg-hex};

            accent-color: ${accent-hex};
            urgent-color: ${yellow-hex};

            background-color: transparent;
            text-color: @fg;

            margin: 0;
            padding: 0;
            spacing: 0;
        }

        window {
            location: center;
            width: 580;

            background-color: @bg0;
            border: 2px;
            border-color: @accent-color;
        }

        inputbar {
            spacing: 4px;
            padding: 4px;

            background-color: @bg1;
        }

        prompt, entry, element-icon, element-text {
            vertical-align: 0.5;
        }

        prompt {
            text-color: @accent-color;
        }

        textbox {
            padding: 4px;
            background-color: @bg1;
        }

        listview {
            padding: 4px 0;
            lines: 8;
            columns: 1;

            fixed-height: false;
        }

        element {
            padding: 4px;
            spacing: 4px;
        }

        element normal normal {
            text-color: @fg;
        }

        element normal urgent {
            text-color: @urgent-color;
        }

        element normal active {
            text-color: @accent-color;
        }

        element alternate active {
            text-color: @accent-color;
        }

        element selected {
            text-color: @bg0;
        }

        element selected normal, element selected active {
            background-color: @accent-color;
        }

        element selected urgent {
            background-color: @urgent-color;
        }

        element-icon {
            size: 0.8em;
        }

        element-text {
            text-color: inherit;
        }
    '');

    programs.wezterm.extraConfig = ''
        config = {
            colors = {
                tab_bar = {
                    background = "none",

                    active_tab = {
                        bg_color = "none",
                        fg_color = "${accent-hex}",
                    },
                    inactive_tab = {
                        bg_color = "none",
                        fg_color = "${bg2-hex}",
                    },
                    inactive_tab_hover = {
                      bg_color = "none",
                      fg_color = "${grey1-hex}",
                    },
                    new_tab = {
                        bg_color = "none",
                        fg_color = "${bg2-hex}",
                    },
                    new_tab_hover = {
                        bg_color = "none",
                        fg_color = "${grey1-hex}",
                    },
                },
            },

            -- Normal config here (~/dotfiles/modules/home/wezterm.nix)
    '';
}

