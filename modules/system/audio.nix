{...}: {
    flake.modules.nixos.audio = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [alsa-utils];

        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
    };
}
