{...}: {
  flake.modules.nixos.driveMounting = {
    services = {
      udisks2.enable = true;
      devmon.enable = true;
    };
  };
}
