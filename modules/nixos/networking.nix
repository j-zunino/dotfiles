{...}: {
    services.connman.wifi.backend = "iwd";

    networking = {
        hostName = "nixos";

        networkmanager.wifi.backend = "iwd";

        wireless.iwd.enable = true;
        wireless.iwd.settings = {
            IPv6 = {
                Enabled = true;
            };
            Settings = {
                AutoConnect = true;
            };
        };
    };
}
