{config, ...}: let
    colors = config.my.colors;
    stylixFonts = config.stylix.fonts;
    margin-inline = "0 10px";
in {
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 24;

                modules-left = [
                    "custom/icon"
                    "hyprland/workspaces"
                ];

                modules-center = [
                    "clock"
                    "custom/gpu-screen-recorder"
                ];

                modules-right = [
                    "tray"
                    "cpu"
                    "memory"
                    "bluetooth"
                    "pulseaudio"
                    "network"
                    "battery"
                ];

                # - [ LEFT ] -
                "custom/icon" = {
                    format = "󰛄";
                    tooltip = false;
                    on-click = "rofi_logout";
                };

                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "1" = [];
                        "2" = [];
                        "3" = [];
                        "4" = [];
                    };
                };

                # - [ CENTER ] -
                clock = {
                    format = "{:%A %I:%M %p}";
                    format-alt = "{:%A %H:%M}";
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
                        format = {
                            months = "<span color='${colors.accent-hex}'>{}</span>";
                            days = "<span color='${colors.fg-hex}'>{}</span>";
                            weeks = "<span color='${colors.bg2-hex}'>W{}</span>";
                            weekdays = "<span color='${colors.gray1-hex}'>{}</span>";
                            today = "<span color='${colors.red-hex}'><b><u>{}</u></b></span>";
                        };
                    };
                };

                # - [ RIGHT ] -
                tray = {
                    icon-size = stylixFonts.monospace.name;
                    spacing = 10;
                };

                "custom/gpu-screen-recorder" = {
                    exec = "~/dotfiles/home/modules/scripts/gpu_replay.sh";
                    interval = 3;
                    return-type = "json";
                    tooltip = true;
                };

                cpu = {
                    format = "󰍛";
                    on-click = "wezterm start --class floating btop";
                    states = {
                        warning = 70;
                        critical = 90;
                    };
                };

                memory = {
                    format = " ";
                    on-click = "wezterm start --class floating btop";
                    states = {
                        warning = 70;
                        critical = 90;
                    };
                };

                bluetooth = {
                    format-disabled = "󰂲";
                    format = "";
                    format-connected = "󰂱";
                    tooltip-format = "Devices connected: {num_connections}\n  {device_battery_percentage}%";
                    on-click = "wezterm start --class floating bluetui";
                };

                pulseaudio = {
                    format = "{icon}";
                    tooltip-format = "{icon} {volume}%";
                    format-muted = "󰝟";
                    format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
                    scroll-step = 1;
                    on-click = "wezterm start --class floating wiremix";
                    on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    # ignored-sinks = ["Easy Effects Sink"];
                };

                network = {
                    format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
                    format = "{icon}";
                    format-wifi = "{icon}";
                    format-ethernet = "󰀂";
                    format-disconnected = "";
                    tooltip-format-wifi = "{essid} ({frequency} GHz)\n{icon} {signalStrength}%  ↓{bandwidthDownBytes}  ↑{bandwidthUpBytes}";
                    tooltip-format-ethernet = "{icon} ↓{bandwidthDownBytes} ↑{bandwidthUpBytes}";
                    on-click = "wezterm start --class floating impala";
                };

                battery = {
                    interval = 5;
                    format = "{capacity}% {icon}";
                    format-full = "󰂄";
                    format-icons = {
                        default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
                        charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
                    };
                    tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
                    tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
                    states = {
                        warning = 30;
                        critical = 20;
                    };
                };
            };
        };

        style = ''
            * {
                background: ${colors.bg1-hex};
                font-family: ${stylixFonts.monospace.name};
                font-size: ${toString stylixFonts.sizes.terminal}px;

                margin: 0;
                padding: 0;
                border: none;
                border-radius: 0;
                text-shadow: none;
                box-shadow: none;
            }
            window#waybar { color: ${colors.gray1-hex}; }
            .charging { color: ${colors.accent-hex}; }
            .warning { color: ${colors.yellow-hex}; }
            .critical { color: ${colors.red-hex}; }
            tooltip {
                border: 2px solid;
                border-color: ${colors.accent-hex};
            }
            tooltip label {
                color: ${colors.fg-hex};
            }


            #custom-icon {
                color: ${colors.green-hex};
                margin: ${margin-inline};
            }

            #workspaces button {
                color: ${colors.gray1-hex};
                padding: 0 4px;
            }
            #workspaces button.empty {
                color: inherit;
                opacity: 0.5;
            }
            #workspaces button:hover {
                color: ${colors.fg-hex};
                font-weight: bold;
                background: transparent;
                opacity: 1;
            }
            #workspaces button.active {
                color: ${colors.accent-hex};
                font-weight: bold;
                opacity: 1;
            }

            #custom-gpu-screen-recorder.recording { color: ${colors.red-hex}; }

            #cpu,
            #memory,
            #bluetooth,
            #pulseaudio,
            #network,
            #battery,
            #custom-gpu-screen-recorder.recording {
                min-width: ${toString stylixFonts.sizes.terminal}px;
                margin: ${margin-inline};
            }
        '';
    };
}
