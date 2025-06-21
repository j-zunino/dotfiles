{...}: {
    services = {
        acpid.enable = true;
        printing.enable = false;
        fstrim.enable = true;
        dbus.enable = true;
    };
}
