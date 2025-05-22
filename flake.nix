{
    description = "A basic NixOS configuration flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zjstatus.url = "github:dj95/zjstatus";
    };

    outputs = inputs @ {
        nixpkgs,
        flake-utils,
        nixos-wsl,
        home-manager,
        zjstatus,
        ...
    }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [
                    nixos-wsl.nixosModules.default
                    {
                        system.stateVersion = "24.11";
                        wsl.enable = true;
                    }
                    ./nixos/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            juan = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs {
                    system = "x86_64-linux";
                    overlays = [
                        (final: prev: {
                            zjstatus = inputs.zjstatus.packages."x86_64-linux".default;
                        })
                    ];
                };
                extraSpecialArgs = {inherit inputs;};
                modules = [
                    ./home/home.nix
                ];
            };
        };
    };
}
