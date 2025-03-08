{ ... }:

{
    services = {
        acpid.enable = true;
        printing.enable = true;
        dbus.enable = true;
        #flatpak.enable = true;
        keyd = {
            enable = true;
            keyboards = {
                default = {
                    ids = [ "*" ];
                    settings = {
                        main = {
                            capslock = "overload(control, esc)";
                        };
                    };
                };
            };
        };
    };
}
