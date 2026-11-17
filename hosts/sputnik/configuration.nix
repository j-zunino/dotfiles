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
            boot

            # System
            power-options
            power-sleep
            power-tlp
            ethernet
            thermal
            zram
            wifi

            # Shell
            ssh-server
            zsh
        ];
    };

    flake.modules.homeManager.sputnik-sputnik = {
        imports = with self.modules.homeManager; [
            common-settings
            users-sputnik

            # Dev
            lazygit
            direnv
            nvim
            git
            dev

            # Shell
            common-cli
            tmux
            zsh
            fzf
            ssh
        ];
    };
}
