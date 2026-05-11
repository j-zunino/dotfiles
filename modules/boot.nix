{self, ...}: {
  flake.modules.nixos.systemd-boot = {
    boot.loader.systemd-boot.enable = true;
  };

  flake.modules.nixos.efi = {
    boot.loader.efi.canTouchEfiVariables = true;
  };

  flake.modules.nixos.grub = {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      devices = ["nodev"];
    };
  };

  flake.modules.nixos.greetd = {
    pkgs,
    lib,
    ...
  }: let
    tuigreet = lib.getExe pkgs.tuigreet;
  in {
    services.greetd = {
      enable = true;
      settings.default_session.command = "${tuigreet} --time --remember --remember-user-session --theme 'border=green'";
    };

    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };

  flake.modules.nixos.boot = {self, ...}: {
    imports = with self.modules.nixos; [efi systemd-boot greetd];
  };

  flake.modules.nixos.dualboot = {self, ...}: {
    imports = with self.modules.nixos; [efi grub greetd];
  };
}
