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

        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        wezterm.url = "github:wez/wezterm?dir=nix";

        zen-browser.url = "github:0xc000022070/zen-browser-flake";

        iwmenu.url = "github:e-tho/iwmenu";
    };

    outputs = inputs @ {
        nixpkgs,
        flake-utils,
        home-manager,
        ...
    }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [
                    ./nixos/configuration.nix
                    ./nixos/hardware-configuration.nix
                    inputs.stylix.nixosModules.stylix
                ];
            };
        };

        homeConfigurations = {
            juan = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs {system = "x86_64-linux";};
                extraSpecialArgs = {inherit inputs;};
                modules = [
                    ./home/home.nix
                    inputs.stylix.homeModules.stylix
                ];
            };
        };
    };
}
