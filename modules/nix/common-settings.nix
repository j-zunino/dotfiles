{...}: {
    flake.modules.nixos.common-settings = {
        nixpkgs.config.allowUnfree = true;
        system.stateVersion = "24.05";

        nix = {
            settings = {
                experimental-features = ["nix-command" "flakes"];
                download-buffer-size = 524288000;
            };

            optimise.automatic = true;

            gc = {
                automatic = true;
                dates = "weekly";
                options = "--delete-older-than 7d";
            };
        };

        time.timeZone = "America/Argentina/Buenos_Aires";
        i18n = {
            defaultLocale = "en_US.UTF-8";
            extraLocaleSettings.LC_TIME = "es_AR.UTF-8";
        };
    };

    flake.modules.homeManager.common-settings = {
        nixpkgs.config.allowUnfree = true;
    };
}
