{pkgs, ...}: {
  imports = [
    ../modules/home/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
    bat.enable = true;
    eza.enable = true;
  };

  home = {
    username = "juan";
    homeDirectory = "/home/juan";

    stateVersion = "24.05";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      # Applications
      nautilus
      discord
      tiled
      love
      gimp
      vlc

      # Utilities
      hyprshot
      ripgrep
      syshud
      unzip
      curl
      wget

      # prismlauncher
    ];
  };
}
