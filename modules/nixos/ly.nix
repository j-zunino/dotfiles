{...}: {
    services = {
        displayManager = {
            ly = {
                enable = true;
                settings = {
                    clear_password = true;
                    animation = "matrix";
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
