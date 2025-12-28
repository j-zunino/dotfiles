{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.emulation {
        home.packages = with pkgs; [
            pcsx2
            (retroarch.withCores (cores:
                with cores; [
                    citra
                    melonds
                ]))
        ];
    };
}
