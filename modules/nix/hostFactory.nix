{
    inputs,
    self,
    ...
}: {
    config.flake.factory.host = {
        name,
        user,
    }: {
        nixosConfigurations.${name} = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [self.modules.nixos.${name}];
        };

        homeConfigurations."${user}@${name}" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs;};
            modules = [self.modules.homeManager."${name}-${user}"];
        };
    };
}
