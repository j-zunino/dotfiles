{...}: {
    nixpkgs.config.allowUnfree = true;

    nix = {
        settings = {
            experimental-features = ["nix-command" "flakes"];
            download-buffer-size = 524288000;
        };

        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };

    system.autoUpgrade = {
        enable = true;
        channel = "https://nixos.org/channels/nixos-unstable";
    };

    time.timeZone = "America/Argentina/Buenos_Aires";

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
}
