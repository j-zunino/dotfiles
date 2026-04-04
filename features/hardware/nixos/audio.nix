{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.hardware.audio {
        environment.systemPackages = [pkgs.alsa-utils];
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };
}
