{
    inputs,
    self,
    ...
}: {
    flake.nixosConfigurations.sputnik = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [self.modules.nixos.sputnik];
    };

    flake.homeConfigurations."sputnik@sputnik" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [self.modules.homeManager.sputnik-sputnik];
    };

    flake.modules.nixos.sputnik = {
        networking.hostName = "sputnik";
        my.ssh.allowUsers = ["sputnik"];

        imports = with inputs.self.modules.nixos; [
            common-settings
            users-sputnik
            home-manager
            ethernet
            zsh

            # Shell
            ssh-server
        ];
    };

    flake.modules.homeManager.sputnik-sputnik = {
        imports = with self.modules.homeManager; [
            common-settings
            users-sputnik

            # Dev
            nvim
            git

            # Shell
            common-cli
            zsh
            ssh
        ];
    };
}
