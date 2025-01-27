{ pkgs, config, ... }:

{
    programs = {
        rofi = {
            package = pkgs.rofi-wayland;
            enable = true;
            location = "center";
            extraConfig = {
                kb-row-up = "Up,Control+k";
                kb-row-down = "Down,Control+j";
                kb-accept-entry = "Tab,Control+m,Return,KP_Enter";
                kb-remove-to-eol = "Control+K";
                kb-element-next = "Shift+Tab";
                kb-element-prev = "ISO_Left_Tab";
            };
        };
    };
}
