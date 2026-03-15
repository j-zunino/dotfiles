{
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.zram.enable {
        zramSwap = {
            enable = true;
            memoryPercent = config.features.hardware.zram.percent;
            algorithm = "lz4";
        };
    };
}
