{ config, ... }:

{
    services = {
        acpid.enable = true;
        printing.enable = true;
        dbus.enable = true;
        #flatpak.enable = true;

        picom = {
            enable = true;
            backend = "egl";
            vSync = "opengl";
        };
    };
}
