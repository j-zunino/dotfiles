{...}: {
    flake.modules.nixos.upower = {
        services.upower = {
            enable = true;
            percentageLow = 30;
            percentageCritical = 20;
        };
    };
}
