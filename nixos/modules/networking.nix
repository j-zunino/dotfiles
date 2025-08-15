{...}: {
    services.connman.wifi.backend = "iwd";

    networking = {
        networkmanager.wifi.backend = "iwd";

        # TODO: Move to latitude config
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
