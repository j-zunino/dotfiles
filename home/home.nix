{ pkgs, lib, config, ... }:

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

        pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
        };

        packages = with pkgs; [
            wget
            curl
            fzf
            gcc
            gnumake
            unzip
            nodejs_22
            pnpm
            ripgrep
            tree
            discord
            gimp
            inkscape
            vlc
            cargo
            hyprshot
            godot_4
            nautilus
            fd
            firefox

            # prismlauncher
        ];

    };
}
