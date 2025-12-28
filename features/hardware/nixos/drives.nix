{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.driveMounting {
        services.udisks2.enable = true;
    };
}
