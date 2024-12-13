{ pkgs, config, ... }:

let
    inherit (config.lib.formats.rasi) mkLiteral;
    rofi-theme = {
        "*" = {
            bg0 = mkLiteral "#2B3339";
            bg1 = mkLiteral "#323D43";
            fg0 = mkLiteral "#D3C6AA";

            accent-color = mkLiteral "#A7C080";
            urgent-color = mkLiteral "#DBBC7F";

            background-color = mkLiteral "transparent";
            text-color = mkLiteral "@fg0";

            margin = 0;
            padding = 0;
            spacing = 0;
        };

        "window" = {
            location = mkLiteral "center";
            width = 580;

            background-color = mkLiteral "@bg0";
            border = mkLiteral "2px";
            border-color = mkLiteral "@accent-color";
        };

        "inputbar" = {
            spacing = mkLiteral "4px";
            padding = mkLiteral "4px";

            background-color = mkLiteral "@bg1";
        };

        "prompt, entry, element-icon, element-text" = {
            vertical-align = mkLiteral "0.5";
        };

        "prompt" = {
            text-color = mkLiteral "@accent-color";
        };

        "textbox" = {
            padding = mkLiteral "4px";
            background-color = mkLiteral "@bg1";
        };

        "listview" = {
            padding = mkLiteral "4px 0";
            lines =  8;
            columns =  1;

            fixed-height = mkLiteral "false";
        };

        "element" = {
            padding = mkLiteral "4px";
            spacing = mkLiteral "4px";
        };

        "element normal normal" = {
            text-color = mkLiteral "@fg0";
        };

        "element normal urgent" ={
            text-color = mkLiteral "@urgent-color";
        };

        "element normal active" = {
            text-color = mkLiteral "@accent-color";
        };

        "element alternate active"= {
            text-color = mkLiteral "@accent-color";
        };

        "element selected" ={
            text-color = mkLiteral "@bg0";
        };

        "element selected normal, element selected active" ={
            background-color = mkLiteral "@accent-color";
        };

        "element selected urgent" ={
            background-color = mkLiteral "@urgent-color";
        };

        "element-icon" = {
            size = mkLiteral "0.8em";
        };

        "element-text" ={
            text-color = mkLiteral "inherit";
        };
    };
in {
    programs = {
        rofi = {
            package = pkgs.rofi-wayland;
            enable = true;
            font = "JetBrainsMono Nerd Font 11";
            location = "center";
            theme = rofi-theme;
        };
    };
}
