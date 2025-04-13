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
            on-click = "sh $HOME/dotfiles/modules/home/scripts/dunst-notify.sh mute";
            ignored-sinks = ["Easy Effects Sink"];
          };

          "network" = {
            format = "{ifname}";
            format-wifi = "{icon} ";
            format-disconnected = "󰤮";
            tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
            tooltip-format-disconnected = "󰤮";

            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

            on-click = "dm-wifi";
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
          border: none;
          border-radius: 0;
          min-height: 0;
          margin: 0;
          padding: 0;
          box-shadow: none;
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

        #tray,
        #clock.date,
        #temperature,
        #pulseaudio {
          padding: 0 8px;
        }

        #backlight {
          padding: 0 12px 0 8px;
        }

        #window,
        #battery,
        #workspaces,
        #workspaces button {
          padding: 0 4px;
        }

        #network {
          padding: 0 4px 0 8px;
        }

        #cpu,
        #memory {
          padding: 0 2px;
        }

        #cpu {
          margin-right: 4px;
        }

        #memory {
          margin: 0 12px 0 4px;
        }
      '';
    };
  };
}
