{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gaming.heroic {
        environment.systemPackages = with pkgs; [
            heroic
        ];
    };
}
