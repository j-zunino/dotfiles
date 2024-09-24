{ config, pkgs, ... }:

{
    users.users.juan = {
        isNormalUser = true;
        initialPassword = "password";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    system.autoUpgrade = {
        enable = true;
        channel = "https://nixos.org/channels/nixos-24.05";
    };

    time.timeZone = "America/Argentina/Buenos_Aires";

    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;

    i18n = {
        defaultLocale = "en_US.UTF-8";

        extraLocaleSettings = {
            LC_ADDRESS = "es_AR.UTF-8";
            LC_IDENTIFICATION = "es_AR.UTF-8";
            LC_MEASUREMENT = "es_AR.UTF-8";
            LC_MONETARY = "es_AR.UTF-8";
            LC_NAME = "es_AR.UTF-8";
            LC_NUMERIC = "es_AR.UTF-8";
            LC_PAPER = "es_AR.UTF-8";
            LC_TELEPHONE = "es_AR.UTF-8";
            LC_TIME = "es_AR.UTF-8";
        };
    };

    console = {
        keyMap = "la-latin1";
    };
}
