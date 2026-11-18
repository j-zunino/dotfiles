{
    inputs,
    lib,
    ...
}: {
    flake.modules.generic.upower = {
        options.my.power.criticalPowerAction = lib.mkOption {
            type = lib.types.enum ["PowerOff" "Hibernate" "HybridSleep" "Suspend"];
            default = "PowerOff";
            description = "upower criticalPowerAction. Hibernate needs a boot.resumeDevice.";
        };
    };

    flake.modules.nixos.upower = {config, ...}: {
        imports = [inputs.self.modules.generic.upower];

        services.upower = {
            enable = true;
            percentageLow = 20;
            percentageCritical = 10;
            percentageAction = 5;
            criticalPowerAction = config.my.power.criticalPowerAction;
        };
    };
}
