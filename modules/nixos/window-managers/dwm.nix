{ pkgs, ... }:

{
    services = {
        xserver = {
            windowManager = {
                dwm = {
                    enable = false;
                    package = pkgs.dwm.overrideAttrs {
                        src = /home/juan/dwm;
                    };
                };
            };
        };
    };
}

