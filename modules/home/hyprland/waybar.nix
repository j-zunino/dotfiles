{ ... }:

{
    programs = {
        waybar = {
            enable = true;

            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 20;

                    modules-left = [
                        "custom/nix-logo"
                        "custom/arrow-l-1"
                        "hyprland/workspaces"
                        "custom/arrow-l-2"
                        "hyprland/window"
                        "custom/arrow-l-3"
                    ];

                    modules-center = [
                        "custom/arrow-c-1"
                        "clock#day"
                        "custom/arrow-c-2"
                        "clock#time"
                        "custom/arrow-c-3"
                        "clock#date"
                        "custom/arrow-c-4"
                    ];

                    modules-right = [
                        "custom/arrow-r-1"
                        "tray"
                        "cpu"
                        "memory"
                        "custom/arrow-r-2"
                        "backlight"
                        "pulseaudio"
                        "network"
                        "battery"
                        "custom/arrow-r-3"
                        "custom/poweroff"
                    ];


                    # - [ LEFT ] -
                    "custom/nix-logo" = {
                        format = " ";
                        tooltip = false;
                    };

                    "hyprland/workspaces" = {
                        active-only = false;
                    };

                    "hyprland/window" = {
                        max-length = 25;
                    };

                    # - [ CENTER ] -
                    "clock#day" = {
                        format = "{:%a}";
                        tooltip = false;
                    };

                    "clock#time" = {
                        interval = 60;
                        format = "{:%H:%M}";
                        format-alt = "{:%A, %B %d, %Y (%R)}";
                        tooltip-format = "<tt><small>{calendar}</small></tt>";
                        calendar = {
                            mode = "month";
                            mode-mon-col = 3;
                            weeks-pos = "right";
                            on-scroll = 1;
                            format = {
                                months =     "<span color='#e67e80'><b>{}</b></span>";
                                days =       "<span color='#d3c6aa'><b>{}</b></span>";
                                weeks =      "<span color='#a7c080'><b>W{}</b></span>";
                                weekdays =   "<span color='#a7c080'><b>{}</b></span>";
                                today =      "<span color='#a7c080'><b><u>{}</u></b></span>";
                            };
                        };
                        actions = {
                            on-click-right = "mode";
                            on-scroll-up = "shift_up";
                            on-scroll-down = "shift_down";
                        };
                    };

                    "clock#date" = {
                        format = "{:%d/%m}";
                        tooltip = false;
                    };

                    # - [ RIGHT ] -
                    "tray" = {
                        "icon-size" = 15;
                        spacing = 10;
                    };

                    "cpu" = {
                        format = "  {usage}%";
                    };

                    "memory" = {
                        format = "  {percentage}%";
                    };

                    "backlight" = {
                        # format = "{icon} {percent}%";
                        format = "{icon}";
                        format-icons = [ "󱩎 " "󱩏 " "󱩐 " "󱩑 " "󱩒 " "󱩓 " "󱩔 " "󱩕 " "󱩖 " "󰛨 " ];
                        tooltip-format = "{icon} {percent}%";
                    };

                    "pulseaudio" = {
                        # format = "{icon} {volume}%";
                        # format-bluetooth = "{icon} {volume}%";
                        format = "{icon}";
                        format-bluetooth = "{icon}";
                        format-muted = "󰖁 ";
                        tooltip-format = "{icon} {volume}%";
                        format-icons = {
                            headphone = " ";
                            # hands-free = "";
                            # headset = "";
                            phone = " ";
                            phone-muted = " ";
                            portable = " ";
                            car = " ";
                            default = [ "󰝟 " "󰕿 " "󰕿 " "󰕿 " "󰕿 " "󰕿 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰕾 " ];
                        };
                        scroll-step = 1;
                        on-click = "sh ~/dotfiles/modules/home/scripts/dunst-notify.sh mute";
                        ignored-sinks = ["Easy Effects Sink"];
                    };

                    "network" = {
                        format = "{ifname}";

                        # format-wifi = "{icon} {signalStrength}%";
                        format-wifi = "{icon}";
                        format-disconnected = "󰤮 ";
                        tooltip-format-wifi = "{essid} ({signalStrength}%) {icon}";
                        tooltip-format-disconnected = "󰤮 ";

                        format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
                    };

                    "battery" = {
                        interval = 10;
                        states = {
                            warning = 30;
                            critical = 15;
                        };

                        format = "{icon} {capacity}%";
                        format-charging = "󰂄 {capacity}%";
                        format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];

                        max-length = 25;
                    };

                    "custom/poweroff" = {
                        format = "󰐥";
                        tooltip = false;
                        on-click = "dm-logout";
                    };

                    # - [ ARROWS LEFT ] -
                    "custom/arrow-l-1" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-l-2" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-l-3" = {
                        format = "";
                        tooltip = false;
                    };

                    # - [ ARROWS CENTER ] -
                    "custom/arrow-c-1" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-c-2" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-c-3" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-c-4" = {
                        format = "";
                        tooltip = false;
                    };


                    # - [ ARROWS RIGHT ] -
                    "custom/arrow-r-1" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-r-2" = {
                        format = "";
                        tooltip = false;
                    };

                    "custom/arrow-r-3" = {
                        format = "";
                        tooltip = false;
                    };
                };
            };

            style = ''
                @define-color bg_dim #232a2e;
                @define-color bg0    #2d353b;
                @define-color bg1    #343f44;
                @define-color bg2    #3d484d;
                @define-color bg3    #475258;
                @define-color bg4    #4f585e;
                @define-color bg5    #56635f;

                @define-color gray0  #7a8478;
                @define-color gray1  #859289;
                @define-color gray2  #9da9a0;

                @define-color fg     #d3c6aa;

                @define-color red    #e67e80;
                @define-color orange #e69875;
                @define-color yellow #dbbc7f;
                @define-color green  #a7c080;
                @define-color blue   #7fbbb3;
                @define-color aqua   #83c092;
                @define-color purple #d699b6;

                * {
                    border: none;
                    border-radius: 0;
                    min-height: 0;
                    margin: 0;
                    padding: 0;
                    box-shadow: none;
                    text-shadow: none;
                    /* font-family: CaskaydiaMono Nerd Font; */
                    font-family: JetBrainsMono Nerd Font;
                }

                window#waybar {
                    background: @bg0;
                    color: @fg;
                    padding: 0 8px;
                }

                /* - [ LEFT ] - */
                #custom-nix-logo {
                    font-size: 20px;
                    background: @green;
                    color: @bg_dim;
                    padding: 0 0 0 3px;
                }

                #workspaces {
                    background: @bg2;
                }

                #workspaces button {
                    color: @bg4;
                    padding: 0 4px;
                }

                #workspaces button.active {
                    color: @green;
                    font-weight: bold;
                }

                #workspaces button:hover {
                    background: @bg2;
                    color: @gray2;
                }

                #window {
                    background: @bg1;
                    padding: 0 8px;
                }

                /* - [ CENTER ] - */
                #clock {
                    padding: 0 8px;
                }

                #clock.day,
                #clock.date {
                    background: @bg1;
                    color: @fg;
                }

                #clock.time {
                    background: @green;
                    color: @bg_dim;
                }

                /* - [ RIGHT ] - */
                #tray,
                #memory,
                #cpu,
                #pulseaudio,
                #backlight,
                #network,
                #battery {
                    padding: 0 4px;
                }

                #tray,
                #memory,
                #cpu {
                    background: @bg1;
                }

                #pulseaudio,
                #backlight,
                #network,
                #battery {
                    background: @bg2;
                }

                /* #battery {
                    background: @green;
                    color: @bg_dim;
                } */

                #custom-poweroff {
                    font-size: 20px;
                    background: @green;
                    color: @bg_dim;
                    padding: 0 8px 0 3px;
                }

                tooltip {
                    background: @bg0;
                    border: 2px solid @green;
                }

                tooltip label {
                    color: @fg;
                    padding: 0px 8px;
                }

                /* - [ ARROWS ] - */
                #custom-arrow-l-1,
                #custom-arrow-l-2, 
                #custom-arrow-l-3, 
                #custom-arrow-c-1, 
                #custom-arrow-c-2,
                #custom-arrow-c-3,
                #custom-arrow-c-4,
                #custom-arrow-r-1,
                #custom-arrow-r-2,
                #custom-arrow-r-3{
                    font-size: 20px;
                }

                /* - [ ARROWS LEFT ] - */
                #custom-arrow-l-1 {
                    background: @bg2;
                    color: @green;
                }

                #custom-arrow-l-2 {
                    background: @bg1;
                    color: @bg2;
                }

                #custom-arrow-l-3 {
                    background: @bg0;
                    color: @bg1;
                }

                /* - [ ARROWS CENTER ] - */
                #custom-arrow-c-1, #custom-arrow-c-4 {
                    background: @bg0;
                    color: @bg1;
                }

                #custom-arrow-c-2, #custom-arrow-c-3 {
                    background: @bg1;
                    color: @green;
                }

                /* - [ ARROWS RIGHT ] - */
                #custom-arrow-r-1 {
                    background: @bg0;
                    color: @bg1;
                }

                #custom-arrow-r-2 {
                    background: @bg1;
                    color: @bg2;
                }

                #custom-arrow-r-3 {
                    background: @bg2;
                    color: @green;
                }
            '';
        };
    };
}

