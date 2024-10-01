{
    description = "A basic NixOS configuration flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, flake-utils, home-manager, spicetify-nix, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { system = system; };
    in
    {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = system;
                modules = [
                    ./nixos/configuration.nix
                    ./nixos/hardware-configuration.nix
                ];
            };
        };

        homeConfigurations = {
            juan = home-manager.lib.homeManagerConfiguration {
                pkgs = pkgs;
                extraSpecialArgs = inputs;
                modules = [
                    ./home/home.nix
                ];
            };
        };
    };
}
