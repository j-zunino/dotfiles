{
    config,
    inputs,
    lib,
    self,
    ...
}: let
    mkNixos = host:
        inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [self.modules.nixos.${host}];
        };

    mkHomeManager = host: user:
        inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs;};
            modules = [self.modules.homeManager."${host}-${user}"];
        };
in {
    options.mkHost = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submodule {
            options.user = lib.mkOption {
                type = lib.types.str;
                description = "User whose home configuration is built for this host.";
            };
        });
        default = {};
    };

    config.flake.lib = {inherit mkNixos mkHomeManager;};

    config.flake.nixosConfigurations =
        lib.mapAttrs (
            host: _: mkNixos host
        )
        config.mkHost;

    config.flake.homeConfigurations =
        lib.mapAttrs' (
            host: {user}: lib.nameValuePair "${user}@${host}" (mkHomeManager host user)
        )
        config.mkHost;
}
