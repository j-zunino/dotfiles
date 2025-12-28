{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.drive-mounting {
        services.udiskie = {
            enable = true;
            automount = true;
        };
    };
}
