{...}: {
    flake.modules.nixos.gaming = {pkgs, ...}: {
        # boot.kernelPackages = pkgs.linuxKernel.packages.xanmod_latest;

        programs = {
            gamemode.enable = true;
            steam = {
                enable = true;
                remotePlay.openFirewall = true;
                extraCompatPackages = with pkgs; [proton-ge-bin];
            };
        };

        environment.systemPackages = with pkgs; [
            prismlauncher
            protonplus
            mangohud
            gamemode
            heroic
        ];

        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
        };
    };
}
