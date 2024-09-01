{ config, pkgs, ... }:

{
  imports = [
    ./terminal/alacritty.nix
    ./program/git.nix
    ./program/nvim.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    zsh.enable = true;
  };

  home = {
    username = "juan";
    homeDirectory = "/home/juan";

    sessionPath = [
      "$HOME/dotfiles/script"
    ];

    sessionVariables = {
      # EDITOR = "emacs";
    };

    stateVersion = "24.05";

    packages = with pkgs; [
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
  };
}
