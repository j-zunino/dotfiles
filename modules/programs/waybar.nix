{...}: {
    flake.modules.homeManager.waybar = {
        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    position = "top";
                    margin = "0";
                    spacing = 4;

                    modules-left = [
                        "group/group-power"
                        "ext/workspaces"
                    ];

                    modules-center = [
                        "clock"
                    ];

                    modules-right = [
                        "tray"
                        "cpu"
                        "memory"
                        "bluetooth" # TODO: Render conditionally
                        "group/group-audio"
                        "network"
                        "battery"
                    ];

                    # - [ LEFT ] -
                    "custom/icon" = {
                        format = "󰛄";
                        tooltip = false;
                        on-click = "foot -T 'floating-fzf' -e $HOME/dotfiles/scripts/fzf/logout";
                    };

                    # TODO: Add confirmation to actions
                    "custom/poweroff" = {
                        format = "󰐥";
                        tooltip = false;
                        on-click = "systemctl poweroff";
                    };

                    "custom/reboot" = {
                        format = "󰑐";
                        tooltip = false;
                        on-click = "systemctl reboot";
                    };

                    "custom/suspend" = {
                        format = "󰤄";
                        tooltip = false;
                        on-click = "systemctl suspend";
                    };

                    "custom/logout" = {
                        format = "";
                        tooltip = false;
                        on-click = "loginctl kill-user $UID";
                    };

                    "group/group-power" = {
                        orientation = "inherit";
                        drawer = {
                            transition-duration = 180;
                            transition-left-to-right = true;
                        };
                        modules = [
                            "custom/icon"
                            "custom/poweroff"
                            "custom/reboot"
                            "custom/suspend"
                            "custom/logout"
                        ];
                    };

                    "ext/workspaces" = {
                        on-click = "activate";
                        persistent-workspaces = {
                            "1" = [];
                            "2" = [];
                            "3" = [];
                            "4" = [];
                        };
                    };

                    # - [ CENTER ] -
                    clock = {
                        format = "{:%I:%M %p}";
                        format-alt = "{:%H:%M}";
                        timezone = "America/Argentina/Buenos_Aires";
                        tooltip-format = "<tt>{calendar}</tt>";
                        actions = {
                            on-click-right = "mode";
                            on-scroll-up = "shift_up";
                            on-scroll-down = "shift_down";
                        };

                        calendar = {
                            weeks-pos = "none";
                            on-scroll = 1;
                        };
                    };

                    # - [ RIGHT ] -
                    tray = {
                        spacing = 8;
                    };

                    cpu = {
                        format = " ";
                        states = {
                            warning = 70;
                            critical = 90;
                        };
                    };

                    memory = {
                        format = " ";
                        tooltip-format = "{used}/{total}GiB ({percentage}%) Used\n{swapUsed}/{swapTotal}GiB ({swapPercentage}%) Swap used";
                        states = {
                            warning = 70;
                            critical = 90;
                        };
                    };

                    bluetooth = {
                        format = "";
                        format-disabled = "󰂲";
                        format-connected = "";
                        tooltip-format = "No devices connected";
                        tooltip-format-connected = "Devices connected: {num_connections}\n{device_enumerate}";
                        tooltip-format-enumerate-connected = "{device_alias} - {device_battery_percentage}% 󰥉";
                    };

                    pulseaudio = {
                        format = "{icon} ";
                        tooltip-format = "{icon} {volume}%";
                        format-muted = "󰝟 ";
                        format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
                        scroll-step = 1;
                        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    };

                    "group/group-audio" = {
                        orientation = "inherit";
                        drawer = {
                            transition-duration = 180;
                            transition-left-to-right = true;
                        };
                        modules = [
                            "pulseaudio"
                            "pulseaudio/slider"
                        ];
                    };

                    network = {
                        format = "{icon}";
                        format-wifi = "{icon}";
                        format-icons = [" "];
                        format-ethernet = "󰈁";
                        format-disconnected = " ";
                        tooltip-format-wifi = "{essid} ({frequency} GHz)\n{icon} {signalStrength}%  ↓{bandwidthDownBytes}  ↑{bandwidthUpBytes}";
                        tooltip-format-ethernet = "{icon} ↓{bandwidthDownBytes} ↑{bandwidthUpBytes}";
                    };

                    battery = {
                        format = "{capacity}% {icon} ";
                        format-full = "  ";
                        format-icons = {
                            default = [" " " " " " " " " "];
                            charging = ["󱐋 "];
                        };
                        tooltip-format-discharging = "{capacity}% ({health}%  )\n{power:>1.0f}W↓ ~{time} left";
                        tooltip-format-charging = "{capacity}% ({health}%  )\n{power:>1.0f}W↑ ~{time} left";

                        full-at = 90;
                        states = {
                            warning = 30;
                            critical = 20;
                        };

                        events = {
                            on-discharging-warning = "notify-send -u normal 'Low Battery' 'Connect charger'";
                            on-discharging-critical = "notify-send -u critical 'Very Low Battery' 'Connect charger'";
                            on-charging-100 = "notify-send -u normal 'Battery Full!' 'Please unplug'";
                        };
                    };
                };
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
        stylixFonts = config.stylix.fonts;
        margin-inline = "0 10px";
    in {
        programs.waybar = {
            settings = {
                mainBar = {
                    clock.calendar.format = {
                        months = "<span color='${colors.accent.hex}'>{}</span>";
                        days = "<span color='${colors.fg.hex}'>{}</span>";
                        weeks = "<span color='${colors.bg2.hex}'>W{}</span>";
                        weekdays = "<span color='${colors.gray1.hex}'>{}</span>";
                        today = "<span color='${colors.red.hex}'><b><u>{}</u></b></span>";
                    };
                    tray = {
                        icon-size = stylixFonts.monospace.name;
                    };
                };
            };

            style = ''
                * {
                    margin: 0;
                    padding: 0;
                    border: none;
                    border-radius: 0;
                    text-shadow: none;
                    box-shadow: none;

                    font-family: ${stylixFonts.monospace.name};
                    font-size: ${toString stylixFonts.sizes.terminal}px;
                }

                window#waybar {
                    color: ${colors.gray1.hex};
                    background-color: ${colors.bg0.hex};
                }

                tooltip {
                    background: ${colors.bg0.hex};
                }
                tooltip label {
                    color: ${colors.fg.hex};
                }

                .charging { color: ${colors.accent.hex}; }
                .warning { color: ${colors.yellow.hex}; }
                .critical { color: ${colors.red.hex}; }

                #custom-icon,
                #custom-poweroff,
                #custom-reboot,
                #custom-suspend,
                #custom-logout,
                #workspaces button,
                #cpu,
                #memory,
                #bluetooth,
                #pulseaudio,
                #network,
                battery {
                    min-width: 24px;
                }


                #custom-icon {
                    color: ${colors.accent.hex};
                }

                #custom-poweroff:hover,
                #custom-reboot:hover,
                #custom-suspend:hover,
                #custom-logout:hover,
                #workspaces button:hover {
                    color: ${colors.gray1.hex};
                    background-color: ${colors.bg1.hex};
                }

                #workspaces button {
                    color: alpha(${colors.gray1.hex}, 05);
                }
                #workspaces button.active {
                    color: ${colors.accent.hex};
                    background-color: ${colors.bg1.hex};
                    font-weight: bold;
                }
                #workspaces button.urgent {
                    color: ${colors.red.hex};
                    background-color: alpha(${colors.red.hex}, 0.2);
                }

                #pulseaudio-slider slider {
                    min-height: 0px;
                    min-width: 0px;
                }
                #pulseaudio-slider trough {
                    min-height: 4px;
                    min-width: 80px;
                    background: ${colors.bg1.hex};
                }
                #pulseaudio-slider highlight {
                    min-width: 0px;
                    background: ${colors.gray1.hex};
                }
            '';
        };
    };
}
