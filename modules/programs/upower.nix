{...}: {
    flake.modules.nixos.upower = {config, ...}: {
        services.upower = {
            enable = true;
            percentageLow = 20;
            percentageCritical = 10;
            percentageAction = 5;
            criticalPowerAction = config.my.power.criticalPowerAction;
        };
    };
}
