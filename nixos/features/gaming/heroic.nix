{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.heroic {
        programs.heroic.enable = true;
    };
}
