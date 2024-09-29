{ config, pkgs, ... }:

{
    services = {
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
}

