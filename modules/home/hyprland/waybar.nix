{...}: {
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
            timezone = "America/Argentina/Buenos_Aires";
            format = "{:%a}";
            tooltip = false;
          };

          "clock#time" = {
            interval = 60;
            format = "{:%I:%M %p}";
            timezone = "America/Argentina/Buenos_Aires";
            format-alt = "{:%H:%M}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "month";
              mode-mon-col = 3;
              weeks-pos = "right";
              on-scroll = 1;
            };
            actions = {
              on-click-right = "mode";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };

          "clock#date" = {
            format = "{:%d/%m}";
            timezone = "America/Argentina/Buenos_Aires";
            tooltip = false;
          };

          # - [ RIGHT ] -
          "tray" = {
            "icon-size" = 15;
            spacing = 10;
          };

          "cpu" = {
            format = " {usage}%";

            states = {
              warning = 70;
              critical = 90;
            };
          };

          "memory" = {
            format = " {percentage}%";

            states = {
              warning = 70;
              critical = 90;
            };
          };

          "backlight" = {
            format = "{icon}";
            format-icons = ["󱩎 " "󱩏 " "󱩐 " "󱩑 " "󱩒 " "󱩓 " "󱩔 " "󱩕 " "󱩖 " "󰛨 "];
            tooltip-format = "{icon}{percent}%";
          };

          "pulseaudio" = {
            format = "{icon}";
            format-bluetooth = "{icon}";
            format-muted = "󰖁 ";
            tooltip-format = "{icon}{volume}%";
            format-icons = {
              headphone = " ";
              # hands-free = "";
              # headset = "";
              phone = " ";
              phone-muted = " ";
              portable = " ";
              car = " ";
              default = ["󰖁 " "󰕿 " "󰕿 " "󰕿 " "󰕿 " "󰕿 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰖀 " "󰕾 "];
            };
            scroll-step = 1;
            on-click = "sh $HOME/dotfiles/modules/home/scripts/dunst-notify.sh mute";
            ignored-sinks = ["Easy Effects Sink"];
          };

          "network" = {
            format = "{ifname}";
            format-wifi = "{icon}";
            format-disconnected = "󰤮 ";
            tooltip-format-wifi = "{essid} ({signalStrength}%) {icon}";
            tooltip-format-disconnected = "󰤮 ";

            format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];

            on-click = "dm-wifi";
          };

          "battery" = {
            interval = 5;
            states = {
              warning = 30;
              critical = 20;
            };

            format = "{icon}{capacity}%";
            format-charging = "󰂄{capacity}%";
            format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];

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

          # "custom/arrow-l-3" = {
          #     format = "";
          #     tooltip = false;
          # };

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
          # "custom/arrow-r-1" = {
          #     format = "";
          #     tooltip = false;
          # };

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
        * {
            border: none;
            border-radius: 0;
            min-height: 0;
            margin: 0;
            padding: 0;
            box-shadow: none;
            text-shadow: none;

            font-family: JetBrainsMono Nerd Font;
        }

        /* - [ LEFT ] - */
        #custom-nix-logo {
            font-size: 20px;
        }

        /* - [ RIGHT ] - */
        /* #tray,
        #memory,
        #cpu,
        #pulseaudio,
        #backlight,
        #network,
        #battery {
            padding: 0 4px;
        } */

        #custom-poweroff {
            font-size: 20px;
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

        #custom-nix-logo {
            padding: 0 0 0 4px;
        }
        #custom-poweroff {
            padding: 0 12px 0 4px;
        }

        #workspaces button {
            padding: 0 4px;
        }

        #workspaces,
        #window,
        #clock.day,
        #clock.time,
        #clock.date,
        #tray,
        #cpu,
        #memory,
        #backlight,
        #pulseaudio,
        #network,
        #battery {
            padding: 0 8px;
        }
      '';
    };
  };
}
