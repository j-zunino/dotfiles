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

      element normal active,
      element alternate active {
        text-color: @accent-color;
      }

      element selected {
        text-color: @bg0;
      }

      element selected normal,
      element selected active {
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
            background = "none";
            active_tab = {
              bg_color = "none";
              fg_color = "${accent-hex}";
            };
            inactive_tab = {
              bg_color = "none";
              fg_color = "${bg2-hex}";
            };
            inactive_tab_hover = {
              bg_color = "none";
              fg_color = "${grey1-hex}";
            };
            new_tab = {
              bg_color = "none";
              fg_color = "${bg2-hex}";
            };
            new_tab_hover = {
              bg_color = "none";
              fg_color = "${grey1-hex}";
            };
          };
        };

        -- Normal config here (~/dotfiles/modules/home/wezterm.nix)
    '';
  }
