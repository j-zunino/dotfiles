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
            dualboot
            stylix

            # WM
            hyprland
            mangowc

            # Programs
            fileManager

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
            wm-pkgs
            hyprland
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

        wayland.windowManager.mango.extraConfig = ''
            monitorrule=name:HDMI-A-1,width:1360,height:768,refresh:60,x:0,y:0,scale:1
            monitorrule=name:DP-1,width:1920,height:1080,refresh:60,x:1360,y:0,scale:1
            windowrule=tags:9,appid:spotify
        '';
    };
}
