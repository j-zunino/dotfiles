{
    lib,
    inputs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gui.affinity {
        home.packages = [
            inputs.affinity-nix.packages.x86_64-linux.v3
        ];
    };
}
