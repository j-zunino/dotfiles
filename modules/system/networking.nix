{self, ...}: {
    flake.modules.nixos.networking-common = {
        networking = {
            nameservers = ["1.1.1.1" "1.0.0.1"];

            networkmanager = {
                enable = true;
                insertNameservers = ["1.1.1.1" "1.0.0.1"];
            };
        };
    };

    flake.modules.nixos.ethernet = {
        imports = with self.modules.nixos; [networking-common];
    };

    flake.modules.nixos.wifi = {
        imports = with self.modules.nixos; [networking-common];

        networking = {
            networkmanager.wifi.backend = "iwd";

            wireless.iwd = {
                enable = true;

                settings = {
                    IPv6.Enabled = true;
                    Settings.AutoConnect = true;
                };
            };
        };
    };
}
