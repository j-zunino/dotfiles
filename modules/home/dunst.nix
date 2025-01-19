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
                    progress_bar = false;

                    transparency = 10;
                    frame_width = 2;
                    gap_size = 8;

                    notification_limit = 5;
                };
            };
        };
    };
}
