{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.wm.waybar {
        programs.waybar = let
            colors = config.my.colors;
            stylixFonts = config.stylix.fonts;
            margin-inline = "0 10px";
        in {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 24;

                    modules-left = [
                        "custom/icon"
                        "ext/workspaces"
                    ];

                    modules-center = [
                        "clock"
                        "custom/gpu-screen-recorder"
                    ];

                    modules-right = lib.mkMerge [
                        [
                            "tray"
                            "cpu"
                            "memory"
                        ]
                        (lib.mkIf config.features.hardware.bluetooth [
                            "bluetooth"
                        ])
                        [
                            "pulseaudio"
                            "network"
                            "battery"
                        ]
                    ];

                    # - [ LEFT ] -
                    "custom/icon" = {
                        format = "󰛄";
                        tooltip = false;
                        on-click = "foot -T 'floating-fzf' -e $HOME/dotfiles/features/scripts/fzf/logout"; # TODO: Allow other terminals
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
                                months = "<span color='${colors.accent.hex}'>{}</span>";
                                days = "<span color='${colors.fg.hex}'>{}</span>";
                                weeks = "<span color='${colors.bg2.hex}'>W{}</span>";
                                weekdays = "<span color='${colors.gray1.hex}'>{}</span>";
                                today = "<span color='${colors.red.hex}'><b><u>{}</u></b></span>";
                            };
                        };
                    };

                    # - [ RIGHT ] -
                    tray = {
                        icon-size = stylixFonts.monospace.name;
                        spacing = 10;
                    };

                    "custom/gpu-screen-recorder" = {
                        exec = "~/dotfiles/features/scripts/gpu_replay.sh";
                        interval = 3;
                        return-type = "json";
                        tooltip = true;
                    };

                    cpu = {
                        format = "󰍛";
                        on-click = "~/dotfiles/features/scripts/toggle_floating.sh ${config.features.gui.terminal.default} floating btop";
                        states = {
                            warning = 70;
                            critical = 90;
                        };
                    };

                    memory = {
                        format = " ";
                        tooltip-format = "{used}/{total}GiB ({percentage}%) Used\n{swapUsed}/{swapTotal}GiB ({swapPercentage}%) Swap used";
                        on-click = "~/dotfiles/features/scripts/toggle_floating.sh ${config.features.gui.terminal.default} floating btop";
                        states = {
                            warning = 70;
                            critical = 90;
                        };
                    };

                    bluetooth = {
                        format-disabled = "󰂲";
                        format = "";
                        format-connected = "󰂱";
                        tooltip-format = "No devices connected";
                        tooltip-format-connected = "Devices connected: {num_connections}\n{device_enumerate}";
                        tooltip-format-enumerate-connected = "{device_alias} - {device_battery_percentage}% 󰥉";
                        on-click = "~/dotfiles/features/scripts/toggle_floating.sh ${config.features.gui.terminal.default} floating bluetui";
                    };

                    pulseaudio = {
                        format = "{icon}";
                        tooltip-format = "{icon} {volume}%";
                        format-muted = "󰝟";
                        format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
                        scroll-step = 1;
                        on-click = "~/dotfiles/features/scripts/toggle_floating.sh ${config.features.gui.terminal.default} floating wiremix";
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
                        on-click = "~/dotfiles/features/scripts/toggle_floating.sh ${config.features.gui.terminal.default} floating impala";
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
                        events = {
                            on-discharging-warning = "notify-send -u normal 'Low Battery' 'Connect charger'";
                            on-discharging-critical = "notify-send -u critical 'Very Low Battery' 'Connect charger'";
                            on-charging-100 = "notify-send -u normal 'Battery Full!' 'Please unplug'";
                        };
                    };
                };
            };

            style = ''
                * {
                    background: ${colors.bg1.hex};
                    font-family: ${stylixFonts.monospace.name};
                    font-size: ${toString stylixFonts.sizes.terminal}px;

                    margin: 0;
                    padding: 0;
                    border: none;
                    border-radius: 0;
                    text-shadow: none;
                    box-shadow: none;
                }
                window#waybar { color: ${colors.gray1.hex}; }
                .charging { color: ${colors.accent.hex}; }
                .warning { color: ${colors.yellow.hex}; }
                .critical { color: ${colors.red.hex}; }
                tooltip {
                    border: 2px solid;
                    border-color: ${colors.accent.hex};
                }
                tooltip label {
                    color: ${colors.fg.hex};
                }


                #custom-icon {
                    color: ${colors.green.hex};
                    margin: ${margin-inline};
                }

                #workspaces button {
                    color: ${colors.gray1.hex};
                    padding: 0 4px;
                }
                #workspaces button.empty, #workspaces button.persistent {
                    color: inherit;
                    opacity: 0.5;
                }
                #workspaces button:hover {
                    color: ${colors.fg.hex};
                    font-weight: bold;
                    background: transparent;
                    opacity: 1;
                }
                #workspaces button.active {
                    color: ${colors.accent.hex};
                    font-weight: bold;
                    opacity: 1;
                }
                #workspaces button.urgent {
                    color: ${colors.red.hex}
                }

                #custom-gpu-screen-recorder.recording { color: ${colors.red.hex}; }

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
    };
}
