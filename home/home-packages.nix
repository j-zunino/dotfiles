{pkgs, ...}: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        # Applications
        nautilus
        zathura
        discord
        tiled
        love
        gimp
        vlc

        # WM
        brightnessctl
        playerctl

        # Utilities
        hyprshot
        wiremix
        ripgrep
        syshud
        unzip
        curl
        wget
        zip
        eza
        bat
    ];
}
