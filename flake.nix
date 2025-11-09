{
    description = "A basic NixOS configuration flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        # zen-browser.url = "github:0xc000022070/zen-browser-flake";
        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        affinity-nix.url = "github:mrshmllow/affinity-nix";
    };

    outputs = {
        nixpkgs,
        home-manager,
        ...
    } @ inputs: let
        system = "x86_64-linux";
        homeStateVersion = "24.05";
        user = "juan";
        hosts = [
            {
                hostname = "desktop";
                stateVersion = "24.05";
            }
            {
                hostname = "latitude";
                stateVersion = "24.05";
            }
            {
                hostname = "wsl";
                stateVersion = "24.05";
            }
        ];

        makeSystem = {
            hostname,
            stateVersion,
        }:
            nixpkgs.lib.nixosSystem {
                system = system;
                specialArgs = {inherit inputs stateVersion hostname user;};

                modules =
                    [
                        ./hosts/${hostname}/configuration.nix
                        inputs.stylix.nixosModules.stylix
                    ]
                    ++ nixpkgs.lib.optionals (hostname == "wsl") [inputs.nixos-wsl.nixosModules.default];
            };
    in {
        nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
            configs
            // {
                "${host.hostname}" = makeSystem {
                    inherit (host) hostname stateVersion;
                };
            }) {}
        hosts;

        homeConfigurations = builtins.listToAttrs (map (host: {
            name = "${user}@${host.hostname}";
            value = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                extraSpecialArgs = {
                    inherit inputs homeStateVersion user;
                    hostname = host.hostname;
                };
                modules = [
                    ./home/home.nix
                    inputs.stylix.homeModules.stylix
                ];
            };
        })
        hosts);
        #     .${user} = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages.${system};
        # extraSpecialArgs = {
        #     inherit inputs homeStateVersion user hostname;
        # };
        # modules = [
        #     ./home/home.nix
        #     inputs.stylix.homeModules.stylix
        # ];
    };
}
