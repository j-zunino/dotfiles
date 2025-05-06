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
            "custom/arrow"
            "hyprland/workspaces"
            "hyprland/window"
          ];

          modules-center = [
            "clock#date"
          ];

          modules-right = [
            "group/expand"
            "network"
            "battery"
          ];

          # - [ LEFT ] -
          "custom/nix-logo" = {
            format = " ";
            tooltip = false;
            on-click = "dm-logout";
          };

          "custom/arrow" = {
            format = "";
            tooltip = false;
          };

          "hyprland/workspaces" = {
            active-only = false;
          };

          "hyprland/window" = {
            max-length = 25;
            tooltip = false;
          };

          # - [ CENTER ] -
          "clock#date" = {
            interval = 60;
            timezone = "America/Argentina/Buenos_Aires";
            format = "{:%d.%m.%y | %I:%M %p}";
            format-alt = "{:%d.%m.%y | %H:%M}";
            tooltip-format = "<tt><small>{calendar}</small></tt>";

            calendar = {
              mode = "month";
              mode-mon-col = 3;
              weeks-pos = "none";
              on-scroll = 1;
            };

            actions = {
              on-click-right = "mode";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };

          # - [ RIGHT ] -
          "group/expand" = {
            orientation = "horizontal";
            drawer = {
              transition-duration = 600;
              transition-to-left = true;
              click-to-reveal = true;
            };
            modules = [
              "custom/expand"
              "cpu"
              "memory"
              "custom/separator"
              "tray"
              "temperature"
              "backlight"
              "pulseaudio"
              "custom/separator"
            ];
          };

          "custom/expand" = {
            format = "";
            tooltip = false;
          };

          "cpu" = {
            format = "{usage}% ";

            states = {
              warning = 70;
              critical = 90;
            };
          };

          "memory" = {
            format = "{percentage}% ";

            states = {
              warning = 70;
              critical = 90;
            };
          };

          "custom/separator" = {
            format = "│";
            tooltip = false;
          };

          "tray" = {
            "icon-size" = 15;
            spacing = 10;
          };

          "temperature" = {
            critical-threshold = 80;
            format = "";
            tooltip-format = "{temperatureC}󰔄";
          };

          "backlight" = {
            format = "{icon}";
            format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
            tooltip-format = "{icon} {percent}%";
          };

          "pulseaudio" = {
            format = "{icon}";
            format-bluetooth = "{icon}";
            format-muted = "󰖁";
            tooltip-format = "{icon} {volume}%";
            format-icons = {
              headphone = "";
              # hands-free = "";
              # headset = "";
              phone = "";
              phone-muted = "";
              portable = "";
              car = "";
              default = ["󰖁" "󰕿" "󰕿" "󰕿" "󰕿" "󰕿" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰖀" "󰕾"];
            };
            scroll-step = 1;
            on-click = " wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            ignored-sinks = ["Easy Effects Sink"];
          };

          "network" = {
            format = "{ifname}";
            format-wifi = "{icon} ";
            format-disconnected = "󰤮";
            tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
            tooltip-format-disconnected = "󰤮";

            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

            on-click = "iwmenu --launcher rofi";
          };

          "battery" = {
            interval = 5;
            states = {
              warning = 30;
              critical = 20;
            };

            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];

            max-length = 25;
          };
        };
      };

      style = ''
        * {
          margin: 0;
          padding: 0;
          border: none;
          min-height: 0;
          box-shadow: none;
          border-radius: 0;
          text-shadow: none;
          font-family: JetBrainsMono Nerd Font;
        }

        #custom-arrow,
        #custom-nix-logo {
          font-size: 20px;
        }
        #custom-nix-logo {
          padding-left: 4px;
        }

        tooltip {
          border: 2px solid;
        }

        #workspaces button {
          font-weight: normal;
        }

        #battery,
        #clock.date,
        /* CRITICAL STATE */
        #cpu.critical,
        #memory.critical,
        #battery.critical,
        #temperature.critical,
        /* HOVER */
        #cpu:hover,
        #window:hover,
        #memory:hover,
        #network:hover,
        #battery:hover,
        #backlight:hover,
        #clock.date:hover,
        #pulseaudio:hover,
        #temperature:hover,
        #custom-expand:hover,
        #workspaces button:hover,
        #workspaces button.active {
          font-weight: bold;
        }

        #tray,
        #memory,
        #backlight,
        #clock.date,
        #pulseaudio,
        #temperature {
          margin: 0 8px;
        }

        #cpu,
        #memory,
        #window,
        #network,
        #battery,
        #backlight,
        #pulseaudio,
        #workspaces,
        #temperature,
        #group-expand,
        #custom-expand,
        #workspaces button {
          padding: 0 4px;
        }
      '';
    };
  };
}
