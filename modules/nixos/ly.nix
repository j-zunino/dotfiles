{ ... }:

{
    services = {
        displayManager = {
            ly = {
                enable = true;
                settings = {
                    clear_password = true;
                    hide_borders = true;
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


