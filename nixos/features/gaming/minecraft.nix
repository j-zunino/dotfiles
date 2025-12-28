{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.minecraft {
        evolumennvironment.systemPackages = with pkgs; [
            prismlauncher
        ];
    };
}
