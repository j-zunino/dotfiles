{
    inputs,
    lib,
    ...
}: {
    flake.modules.generic.power-sleep = {
        options.my.power = {
            hibernateDelaySec = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = ''
                    systemd Sleep.HibernateDelaySec. null disables hibernate, so
                    suspend-then-hibernate degrades to a plain suspend.
                '';
            };

            swappiness = lib.mkOption {
                type = lib.types.int;
                default = 100;
                description = "vm.swappiness. Hosts that want a different value override it.";
            };

            scsiLinkPolicy = lib.mkOption {
                type = lib.types.nullOr (lib.types.enum [
                    "min_power"
                    "med_power_with_dipm"
                    "medium_power"
                    "max_performance"
                ]);
                default = null;
                description = ''
                    powerManagement.scsiLinkPolicy. Must stay null on any host that
                    enables TLP, because services.tlp asserts it is null.
                '';
            };
        };
    };

    flake.modules.nixos.power-sleep = {
        config,
        lib,
        ...
    }: {
        imports = [inputs.self.modules.generic.power-sleep];

        services.logind.settings.Login = {
            HandleLidSwitch = "suspend";
            HandleLidSwitchExternalPower = "suspend";
            HandleLidSwitchDocked = "ignore";
            HandlePowerKey = "poweroff";
            IdleAction = "ignore"; # hypridle owns idle
        };

        systemd.sleep.settings.Sleep = lib.mkIf (config.my.power.hibernateDelaySec != null) {
            HibernateDelaySec = config.my.power.hibernateDelaySec;
        };

        boot.kernel.sysctl = {
            "vm.swappiness" = config.my.power.swappiness;
            "vm.page-cluster" = 0; # zram
            "vm.vfs_cache_pressure" = 50;
            "kernel.nmi_watchdog" = 0;
        };

        # Always assigned; it stays null on the TLP host by convention.
        powerManagement.scsiLinkPolicy = config.my.power.scsiLinkPolicy;
    };
}
