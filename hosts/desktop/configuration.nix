{
    inputs,
    self,
    ...
}: let
    host = self.factory.host {
        name = "desktop";
        user = "juan";
    };
in {
    flake.nixosConfigurations = host.nixosConfigurations;
    flake.homeConfigurations = host.homeConfigurations;

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
            power-sleep
            ethernet
            upower
            audio
            zram

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
            affinity
            discord
            spotify
            helium
            nuvio
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
