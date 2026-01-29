{
    lib,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf config.features.hardware.powerManagement.auto-cpufreq {
            systemd.services.battery-limit = {
                wantedBy = ["multi-user.target"];
                serviceConfig.Type = "oneshot";
                script = ''
                    echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
                '';
            };

            services = {
                thermald.enable = true;

                auto-cpufreq = {
                    enable = true;
                    settings = {
                        charger = {
                            governor = "performance";
                            turbo = "auto";
                        };
                        battery = {
                            governor = "powersave";
                            turbo = "never";
                        };
                    };
                };
            };
        })

        (lib.mkIf config.features.hardware.powerManagement.batteryLimit {
            systemd.services.battery-limit = {
                wantedBy = ["multi-user.target"];
                serviceConfig.Type = "oneshot";
                script = ''
                    echo 20 > /sys/class/power_supply/BAT0/charge_control_start_threshold
                    echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
                '';
            };
        })
    ];
}
