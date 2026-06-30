{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        helium = {
            url = "github:schembriaiden/helium-browser-nix-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        spicetify-nix = {
            url = "github:Gerg-L/spicetify-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        affinity-nix.url = "github:mrshmllow/affinity-nix";

        import-tree.url = "github:vic/import-tree";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/default";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {inherit inputs;} {
            imports = [
                inputs.flake-parts.flakeModules.modules
                inputs.home-manager.flakeModules.home-manager

                (inputs.import-tree ./hosts)
                (inputs.import-tree ./modules)
            ];

            systems = import inputs.systems;
        };
}
