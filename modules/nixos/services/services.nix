{...}: {
  services = {
    acpid.enable = true;
    printing.enable = true;
    fstrim.enable = true;
    dbus.enable = true;
  };
}
