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

        imports = with inputs.self.modules.nixos; [
            common-settings
            home-manager
            users-juan
            boot
            stylix

            # WM
            hyprland
            mangowc

            # Programs
            fileManager

            # Gaming
            gaming

            # Hardware
            # TODO: Add intel cpu/gpu?

            # System
            driveMounting
            audio
            zram
            wifi

            # Shell
            zsh
        ];
    };

    flake.modules.homeManager.latitude-juan = {
        imports = with self.modules.homeManager; [
            common-settings
            users-juan
            stylix

            # WM
            notifications
            hyprland
            wm-pkgs
            mangowc
            waybar

            # Programs
            common-gui
            discord
            stremio
            helium
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
