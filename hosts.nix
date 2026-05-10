{
  inputs,
  self,
  config,
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

  flake.modules.nixos.desktop.imports = with self.modules.nixos; [
    home-manager
  ];
}
