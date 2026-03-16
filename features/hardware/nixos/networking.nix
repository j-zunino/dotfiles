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
                nameservers = ["1.1.1.1" "1.0.0.1"];

                networkmanager = {
                    enable = true;
                    wifi.backend = "iwd";
                    insertNameservers = ["1.1.1.1" "1.0.0.1"];
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
