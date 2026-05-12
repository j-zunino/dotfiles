{
    inputs,
    self,
    ...
}: {
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [self.modules.nixos.desktop];
    };

    flake.homeConfigurations.juan = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [self.modules.homeManager.juan];
    };

    flake.modules.nixos.desktop = {
        networking.hostName = "desktop";

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            dualboot
            stylix

            # WM
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

    flake.modules.homeManager.juan = {
        imports = with self.modules.homeManager; [
            common-settings
            users-juan
            stylix

            # WM
            notifications
            wm-pkgs
            mangowc
            waybar

            # Programs
            common-gui
            affinity
            discord
            stremio
            spotify
            helium
            gimp
            mpv
            zen

            # Dev
            terminal
            lazygit
            dev-cli
            direnv
            delta
            nvim
            git

            # Shell
            common-cli
            starship
            tmux
            zsh
            fzf
            ssh
        ];
    };
}
