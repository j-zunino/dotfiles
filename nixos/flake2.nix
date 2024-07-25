{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        juan = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [./configuration.nix];
        };
      };
    };

}
