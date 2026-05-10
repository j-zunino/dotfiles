{
  inputs,
  self,
  config,
  ...
}: {
  flake.nixosConfigurations.default = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      self.modules.nixos.default
    ];
  };

  flake.modules.nixos.default.imports = with self.modules.nixos; [
    ./configuration.nix
  ];
}
