{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.drive-mounting {
        services.udisks2.enable = true;
    };
}
