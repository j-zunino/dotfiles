{...}: {
  flake.modules.nixos.common-settings = {
    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        experimental-features = ["nix-command" "flakes"];
        download-buffer-size = 524288000;
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7";
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
