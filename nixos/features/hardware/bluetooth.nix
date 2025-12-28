{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.bluetooth {
        hardware.bluetooth.enable = true;
        services.blueman.enable = true;

        environment.systemPackages = with pkgs; [bluetui];
    };
}
