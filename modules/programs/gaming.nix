{...}: {
    flake.modules.nixos.gaming = {pkgs, ...}: {
        programs = {
            gamemode = {
                enable = true;
                settings.general = {
                    desiredgov = "performance";
                    softrealtime = "auto";
                    ioprio = 0;
                };
            };

            gamescope = {
                enable = true;
                capSysNice = true;
            };

            steam = {
                enable = true;
                protontricks.enable = true;
                remotePlay.openFirewall = true;
                localNetworkGameTransfers.openFirewall = true;
                extraCompatPackages = with pkgs; [proton-ge-bin];
            };
        };

        hardware.steam-hardware.enable = true;

        services.scx = {
            enable = true;
            scheduler = "scx_lavd";
        };

        boot.kernel.sysctl = {
            "vm.swappiness" = 150;
            "vm.vfs_cache_pressure" = 50;
            "kernel.nmi_watchdog" = 0;
        };

        powerManagement.scsiLinkPolicy = "max_performance";

        environment.systemPackages = with pkgs; [
            prismlauncher
            protonplus
            mangohud
        ];

        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
            PROTON_USE_NTSYNC = "1";
        };
    };
}
