{...}: {
    services = {
        xserver = {
            enable = true;

            desktopManager.plasma5.enable = false;

            xkb = {
                layout = "latam";
                variant = "";
                model = "latitude";
            };

            # Touchpad support
            # libinput.enable = true;
        };
    };
}
