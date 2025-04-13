{...}: {
  services = {
    acpid.enable = true;
    printing.enable = true;
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
