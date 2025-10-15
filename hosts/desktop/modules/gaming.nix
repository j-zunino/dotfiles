{pkgs, ...}: {
    programs = {
        gamemode.enable = true;
        steam = {
            enable = true;
            gamescopeSession.enable = true;
            # remotePlay.openFirewall = true;
            # dedicatedServer.openFirewall = true;

            extraCompatPackages = with pkgs; [
                proton-ge-bin
            ];
        };
    };

    environment = {
        systemPackages = with pkgs; [
            protonup
            protonup-qt
        ];

        sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/juan/.steam/root/compatibilitytools.d";
        };
    };
}
