{...}: {
    services.hypridle = {
        enable = true;
        settings = {
            general.after_sleep_cmd = "hyprctl dispatch dpms on";
            listener = [
                {
                    timeout = 600;
                    on-timeout = "brightnessctl -s set 30";
                    on-resume = "brightnessctl -r";
                }
                {
                    timeout = 1200;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
                {
                    timeout = 1500;
                    on-timeout = "sysemctl suspend";
                }
            ];
        };
    };
}
