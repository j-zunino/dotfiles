{ config, pkgs, ... }:

{
    services = {
        displayManager = {
            sddm.enable = true;
            defaultSession = "none+dwm";

            autoLogin = {
                enable = true;
                user = "juan";
            };
        };
    };

    environment = {
        systemPackages = with pkgs; [
            xorg.libX11
            xorg.xbacklight
            brightnessctl
            playerctl

            # dunst
            # libnotify
        ];
    };
}


