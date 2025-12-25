{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf config.features.gaming.packages {
            services.ratbagd.enable = true;
            environment.systemPackages = with pkgs; [
                gpu-screen-recorder
                protonup-qt
                protonplus
                gamescope
                gamemode
                mangohud
                piper
            ];
        })
    ];
}
