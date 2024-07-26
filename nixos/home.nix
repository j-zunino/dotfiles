{ config, pkgs, ... }:

{
  home.username = "juan";
  home.homeDirectory = "/home/juan";

  programs = {
    git = {
      enable = true;
      userName = "j-zunino";
      userEmail = "zuninojuanbautista@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };


  home.packages = with pkgs; [
    wget
    curl
    bat
    fzf
    gcc
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
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
