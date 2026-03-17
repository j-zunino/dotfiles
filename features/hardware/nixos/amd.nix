{
    lib,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf (config.features.hardware.amd.cpu) {
            boot.kernelParams = ["amd_pstate=active"];
        })
    ];
}
