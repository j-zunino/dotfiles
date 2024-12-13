{ pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            libnotify
        ];
    };

    services = {
        dunst = {
            enable = true;
            settings = {
                global = {
                    width = "(0, 400)";
                    height = "(0, 400)";
                    offset = "15x15";
                    origin = "top-right";
                    alignment = "left";
                    progress_bar = true;

                    transparency = 10;
                    background = "#2d354b";
                    foreground = "#d3c6aa";
                    frame_width = 2;
                    frame_color = "#a7c080";
                    gap_size = 8;

                    # font = "CaskaydiaCove Nerd Font";
                    font = "JetBrainsMono Nerd Font";
                    notification_limit = 5;
                };
            };
        };
    };
}
