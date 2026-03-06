{
    lib,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf (config.features.hardware.ethernet) {
            networking.networkmanager.enable = true;
        })

        (lib.mkIf (config.features.hardware.wifi) {
            services.connman.wifi.backend = "iwd";
            networking = {
                networkmanager = {
                    enable = true;
                    wifi.backend = "iwd";
                };

                wireless.iwd = {
                    enable = true;
                    settings = {
                        IPv6 = {Enabled = true;};
                        Settings = {AutoConnect = true;};
                    };
                };
            };
        })
    ];
}
