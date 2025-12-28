{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.tweaks {
        programs = {
            gamemode.enable = true;
            gamescope.enable = true;
        };
    };
}
