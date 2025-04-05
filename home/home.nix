{pkgs, ...}: {
  imports = [
    ../modules/home/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    bat.enable = true;
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
      inkscape
      nautilus
      discord
      firefox
      gimp
      vlc
      (retroarch.withCores (cores:
        with cores; [
          citra
          melonds
        ]))

      # Utilities
      hyprshot
      ripgrep
      syshud
      unzip
      curl
      tree
      wget

      # godot_4
      # prismlauncher
    ];
  };
}
