{ config, pkgs, ... }:

{
  home.username = "juan";
  home.homeDirectory = "/home/juan";

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName = "j-zunino";
    userEmail = "zuninojuanbautista@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    wget
    curl
    bat
    fzf
    gcc
    gnumake
    unzip
    nodejs_22
    python312Packages.pip
    ripgrep
    python3
    fastfetch
    vscode-fhs
    brave
    discord
    gimp
    inkscape
    vlc
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
