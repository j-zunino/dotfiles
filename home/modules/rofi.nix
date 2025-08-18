{
    config,
    pkgs,
    lib,
    ...
}: let
    colors = config.my.colors;
    stylixFonts = config.stylix.fonts;
in {
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = lib.mkForce "${stylixFonts.monospace.name}  ${toString stylixFonts.sizes.terminal}";
        location = "center";
        extraConfig = {
            kb-row-up = "Up,Control+k";
            kb-row-down = "Down,Control+j";
            kb-accept-entry = "Tab,Control+m,Return,KP_Enter";
            kb-remove-to-eol = "Control+K";
            kb-element-next = "Shift+Tab";
            kb-element-prev = "ISO_Left_Tab";
            display-run = ">";
        };

        theme = lib.mkForce (builtins.toFile "rofi-theme.rasi" ''
            * {
                margin: 0;
                padding: 0;
                spacing: 0;
                text-color: ${colors.fg-hex};
                background-color: transparent;
            }

            #mainbox { children: [ listview, textbox-prompt-colon, inputbar ]; }

            window {
                width: 60ch;
                padding: 1.5ch 2ch;
                border: 2px;
                border-color: ${colors.accent-hex};
                background-color: ${colors.bg0-hex};
            }

            textbox-prompt-colon {
                str: "───────────────────────────────────────────────────────";
                expand: false;
                text-color: ${colors.gray1-hex};
            }


            listview { reverse: true; }

            inputbar { spacing: 1ch; }

            prompt {
                text-color: ${colors.accent-hex};
                font: "${stylixFonts.monospace.name} Bold ${toString stylixFonts.sizes.terminal}";
            }

            entry { cursor-width: 1ch; }


            element {
                padding: 0 0 0 2ch;
                text-color: ${colors.gray1-hex};
            }

            element selected {
                border: 0 0 0 0.6ch;
                border-color: ${colors.accent-hex};
                text-color: ${colors.fg-hex};
                background-color: ${colors.bg1-hex};
            }

            element-text {
                text-color: inherit;
                highlight: bold ${colors.accent-hex};
            }
        '');
    };
}
