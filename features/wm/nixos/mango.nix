{
    lib,
    inputs,
    config,
    ...
}: {
    imports = [inputs.mango.nixosModules.mango];

    config = lib.mkIf config.features.wm.mango {
        programs.mango.enable = true;
    };
}
