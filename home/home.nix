{ pkgs, ... }:

{
    imports = [
        ../modules/home/default.nix
    ];

    nixpkgs.config.allowUnfree = true;

    programs = {
        home-manager.enable = true;
        bash.enable = true;
    };

    home = {
        username = "juan";
        homeDirectory = "/home/juan";

        stateVersion = "24.05";

        sessionVariables = {
            EDITOR = "nvim";
        };

        packages = with pkgs; [
            wget
            curl
            bat
            fzf
            gcc
            gnumake
            unzip
            nodejs_22
            pnpm
            ripgrep
            tree
            brave
            discord
            gimp
            inkscape
            vlc
            cargo
            hyprshot

            # prismlauncher
        ];

    };
}
