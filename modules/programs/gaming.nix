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

        environment.systemPackages = with pkgs; [
            prismlauncher
            protonplus
            mangohud
        ];

        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
            PROTON_USE_NTSYNC = "1";
            __GL_SHADER_DISK_CACHE = "1";
            __GL_SHADER_DISK_CACHE_SIZE = "10737418240";
            __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
        };
    };
}
