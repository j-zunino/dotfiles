{inputs, self, ...}: {
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
            self.modules.nixos.desktop
        ];
    };

    flake.modules.nixos.desktop = {
        networking.hostName = "desktop";
        imports = with inputs.self.modules.nixos; [
            users-juan
            home-manager
            common-settings
            dualboot

            mangowc

            # Hardware
            gpu-nvidia
            cpu-amd

            # Services
            driveMounting
            ethernet
            audio
            zram
        ];
    };

    flake.homeConfigurations.desktop = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = with self.modules.homeManager; [
            users-juan
            common-settings

            # Programs
            zen
            helium

            # Dev
            terminal
            git
            delta
            lazygit
            nvim
            mangowc
        ];
    };
}
