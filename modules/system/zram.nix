{
    inputs,
    lib,
    ...
}: {
    flake.modules.generic.zram = {
        options.my.power.zramPercent = lib.mkOption {
            type = lib.types.int;
            default = 50;
            description = "zramSwap.memoryPercent.";
        };
    };

    flake.modules.nixos.zram = {config, ...}: {
        imports = [inputs.self.modules.generic.zram];

        zramSwap = {
            enable = true;
            algorithm = "lz4";
            memoryPercent = config.my.power.zramPercent;
        };
    };
}
