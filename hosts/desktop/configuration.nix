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

        # Gaming options
        my.power = {
            swappiness = 150;
            scsiLinkPolicy = "max_performance";
        };

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            kernel-zen
            dualboot
            stylix

            # WM
            hyprland
            keyring

            # Programs
            file-manager
            localsend

            # Gaming
            gaming

            # Hardware
            gpu-nvidia
            cpu-amd

            # System
            ethernet
            upower
            audio
            zram
            power-options
            power-sleep

            # Shell
            ssh-server
            tailscale
            zsh
        ];
    };

    flake.modules.homeManager.desktop-juan = {
        imports = with self.modules.homeManager; [
            common-settings
            users-juan
            stylix

            # WM
            quickshell
            hyprland
            hypridle
            keyring
            wm-pkgs

            # Programs
            file-manager
            common-gui
            affinity
            discord
            nuvio
            spotify
            helium
            gimp
            mpv
            imv
            zen

            # Dev
            terminal
            opencode
            lazygit
            direnv
            delta
            nvim
            git
            dev
            llm

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
