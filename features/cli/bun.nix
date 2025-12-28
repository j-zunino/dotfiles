{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.bun {
        programs.bun = {
            enable = true;
            settings = {
                smol = true;
                telemetry = false;
            };
        };
    };
}
