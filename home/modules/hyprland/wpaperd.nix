{user, ...}: {
    services.wpaperd = {
        enable = true;
        settings.any = {
            path = "/home/${user}/dotfiles/wallpapers";
            duration = "30m";
            mode = "center";
        };
    };
}
