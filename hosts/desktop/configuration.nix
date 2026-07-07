{
    inputs,
    self,
    ...
}: {
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [self.modules.nixos.desktop];
    };

    flake.homeConfigurations."juan@desktop" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [self.modules.homeManager.desktop-juan];
    };

    flake.modules.nixos.desktop = {
        networking.hostName = "desktop";

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            kernel-zen
            dualboot
            stylix

            # WM
            hyprland

            # Programs
            fileManager
            localsend

            # Gaming
            gaming

            # Hardware
            gpu-nvidia
            cpu-amd

            # System
            driveMounting
            ethernet
            audio
            zram

            # Shell
            sshServer
            zsh
        ];
    };

    flake.modules.homeManager.desktop-juan = {
        imports = with self.modules.homeManager; [
            common-settings
            users-juan
            stylix

            # WM
            notifications
            hyprland
            wm-pkgs
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
            opencode
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
