{...}: {
    flake.modules.nixos.power-sleep = {
        config,
        lib,
        ...
    }: {
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

        # Only hosts without TLP set this; the laptop uses TLP instead.
        powerManagement.scsiLinkPolicy = config.my.power.scsiLinkPolicy;
    };
}
