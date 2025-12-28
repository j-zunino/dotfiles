{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.tweaks {
        boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

        programs = {
            gamemode.enable = true;
            gamescope.enable = true;
        };
    };
}
