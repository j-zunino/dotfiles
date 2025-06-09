{...}: {
    services.hypridle = {
        enable = true;
        settings = {
            general = {
                after_sleep_cmd = "hyprctl dispatch dpms on";
                before_sleep_cmd = "hyprlock";
            };

            listener = [
                {
                    timeout = 300;
                    on-timeout = "hyprlock";
                }
                {
                    timeout = 600;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
            ];
        };
    };
}
