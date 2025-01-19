{ pkgs, ... }:

{
    users.users.juan = {
        isNormalUser = true;
        shell = pkgs.zsh;
        initialPassword = "password";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    programs.zsh.enable = true;

    system.autoUpgrade = {
        enable = true;
        channel = "https://nixos.org/channels/nixos-unstable";
    };

    time.timeZone = "America/Argentina/Buenos_Aires";

    services.pulseaudio.enable = false;
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
