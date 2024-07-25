{
  description = "A basic NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos.url = "github:nixos/nixos";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; };
    in
    {
      nixosConfigurations = {
        nixos = pkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./configuration.nix
            ./hardware-configuration.nix
          ];
        };
      };
    };
}
