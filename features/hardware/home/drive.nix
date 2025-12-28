{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.driveMounting {
        services.udiskie = {
            enable = true;
            automount = true;
        };
    };
}
