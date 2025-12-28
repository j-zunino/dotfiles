{
    lib,
    user,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.steam {
        programs.steam = lib.mkMerge [
            {
                enable = true;
                gamescopeSession.enable = true;
            }

            (lib.mkIf config.features.gaming.openFirewall {
                remotePlay.openFirewall = true;
                dedicatedServer.openFirewall = true;
            })

            (lib.mkIf config.features.gaming.proton {
                extraCompatPackages = with pkgs; [
                    proton-ge-bin
                ];
            })
        ];

        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${user}/.steam/root/compatibilitytools.d";
        };
    };
}
