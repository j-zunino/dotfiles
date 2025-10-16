{
    hostname,
    pkgs,
    lib,
    ...
}: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs;
        [
            # Base packages
            ripgrep
            unzip
            curl
            love
            wget
            tree
            zip
            bat
        ]
        ++ lib.optionals (hostname != "wsl") [
            # Applications
            nautilus
            zathura
            discord
            tiled
            gimp
            vlc

            # WM
            brightnessctl
            playerctl

            # Utilities
            libnotify
            wiremix
            impala
            syshud
        ];
}
