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

        xserver = {
            windowManager = {
                dwm = {
                    enable = true;
                    package = pkgs.dwm.overrideAttrs {
                    src = /home/juan/dwm;
                    };
                };
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

