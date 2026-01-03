{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.bat {
        programs.bat = {
            enable = true;
        };
    };
}
