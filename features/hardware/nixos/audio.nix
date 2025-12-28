{
    lib,
    pkgs,
    config,
    hostname,
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

            extraConfig = lib.mkIf (hostname == "desktop") {
                pipewire."context.modules" = [
                    {
                        name = "libpipewire-module-alsa-card";
                        args = {
                            "card.name" = "alsa_card.pci-0000_01_00.1";
                            "card.profile" = "output:hdmi-stereo-extra1";
                        };
                    }
                ];
            };
        };
    };
}
