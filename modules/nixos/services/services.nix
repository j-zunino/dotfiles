{...}: {
  services = {
    acpid.enable = true;
    printing.enable = true;
    fstrim.enable = true;
    dbus.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
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
