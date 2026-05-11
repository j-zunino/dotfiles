{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        self.modules.nixos.desktop
      ];
    };

    # latitude = inputs.nixpkgs.lib.nixosSystem {
    #     specialArgs = {inherit inputs;};
    #     modules = [
    #         self.modules.nixos.latitude
    #     ];
    # };
  };

  flake.modules.nixos.desktop = {
    networking.name = "desktop";

    imports = with self.modules.nixos; [
      users-juan
      home-manager
      common-settings
      dualboot

      # Hardware
      gpu-nvidia
      cpu-amd

      # Services
      driveMounting
      ethernet
      audio
      zram
    ];
  };

  flake.modules.homeManager.desktop = {
    imports = with self.modules.homeManager; [
      users-juan
      common-settings

      terminal
    ];
  };
}
