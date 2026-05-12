{inputs, self, ...}: {
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ self.modules.nixos.desktop ];
    };

    flake.homeConfigurations.juan = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules =  [ self.modules.homeManager.juan ];
    };

    flake.modules.nixos.desktop = {
        networking.hostName = "desktop";

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            dualboot
            stylix

            mangowc

            # Hardware
            gpu-nvidia
            cpu-amd

            # System
            driveMounting
            ethernet
            audio
            zram

            # Shell
            zsh
        ];
    };

    flake.modules.homeManager.juan =  {
        imports = with self.modules.homeManager; [
            users-juan
            stylix
            common-settings

            # Programs
            helium
            zen

            # Dev
            terminal
            lazygit
            dev-cli
            mangowc
            delta
            nvim
            git

            # Shell
            common-cli
            starship
            tmux
            zsh
            fzf
        ];
    };
}
