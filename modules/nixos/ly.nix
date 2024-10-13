{ config, pkgs, ... }:

{
    services = {
        displayManager = {
            ly = {
                enable = true;
                settings = {
                    clear_password = true;
                    save = true;
                };
            };

            autoLogin = {
                enable = false;
                user = "juan";
            };
        };
    };
}


