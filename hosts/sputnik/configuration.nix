{
    inputs,
    self,
    ...
}: let
    host = self.factory.host {
        name = "sputnik";
        user = "sputnik";
    };
in {
    flake.nixosConfigurations = host.nixosConfigurations;
    flake.homeConfigurations = host.homeConfigurations;

    flake.modules.nixos.sputnik = {
        config,
        lib,
        ...
    }: {
        networking.hostName = "sputnik";
        my.ssh.allowUsers = ["sputnik"];

        # Only expose SSH and the tarpit on the interface that has the LAN address.
        networking.firewall = {
            allowedTCPPorts = lib.mkForce [];
            interfaces.wlan0.allowedTCPPorts = config.services.openssh.ports ++ [config.services.endlessh.port];
        };

        services.endlessh.openFirewall = lib.mkForce false;

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
