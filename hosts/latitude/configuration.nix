{
    inputs,
    self,
    ...
}: {
    flake.nixosConfigurations.latitude = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [self.modules.nixos.latitude];
    };

    flake.homeConfigurations."juan@latitude" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [self.modules.homeManager.latitude-juan];
    };

    flake.modules.nixos.latitude = {
        networking.hostName = "latitude";

        my.power = {
            cpu.onBat = {
                governor = "powersave";
                epp = "power";
                maxPerfPct = 70; # N5100: 1.1 GHz base / 2.8 GHz burst
                boost = false;
            };
            zramPercent = 40;
            hibernateDelaySec = "30min";
            criticalPowerAction = "Hibernate";
            chargeThreshold = {
                start = 50;
                end = 80;
            };
        };

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            kernel-zen
            stylix
            boot

            # WM
            hyprland
            keyring

            # Programs
            file-manager

            # Gaming
            gaming

            # Hardware
            cpu-intel
            gpu-intel

            # System
            bluetooth
            upower
            audio
            zram
            wifi
            power-options
            power-tlp
            power-sleep
            thermal

            # Shell
            tailscale
            zsh
        ];
    };

    flake.modules.homeManager.latitude-juan = {
        my.idle.suspendCommand = "systemctl suspend-then-hibernate";

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
            discord
            nuvio
            helium
            mpv
            imv
            zen

            # Dev
            opencode-baseline
            terminal
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
