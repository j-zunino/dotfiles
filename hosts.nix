{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      self.modules.nixos.desktop
      ./hardware.nix
    ];
  };

  flake.modules.nixos.desktop.imports = with self.modules.nixos; [
      users-juan
      home-manager
      common-settings
      dualboot

      mangowc

      # Hardware
      gpu-nvidia
      cpu-amd

      # Services
      driveMounting
      ethernet
      audio
      zram
    ];

  flake.modules.homeManager.desktop.imports = with self.modules.homeManager; [
      users-juan
      common-settings

      # Programs
      zen
      helium

      # Dev
      terminal
      git
      nvim
      mangowc
    ];
}
