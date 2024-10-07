{ config, pkgs, ... }:

{
    programs.btop = {
        enable = true;
        settings = {
            color_theme = "everforest-dark-medium";
            vim_keys = true;
            rounded_corners = false;
            temp_scale = "celcius";
            show_battery = true;
        };
    };
}
