{lib, ...}: let
    cpuProfile = lib.types.submodule {
        options = {
            governor = lib.mkOption {
                type = lib.types.str;
                default = "powersave";
                description = "Scaling governor. intel_pstate only accepts powersave/performance.";
            };
            epp = lib.mkOption {
                type = lib.types.str;
                default = "balance_performance";
                description = "CPU energy_performance_preference.";
            };
            maxPerfPct = lib.mkOption {
                type = lib.types.ints.between 1 100;
                default = 100;
                description = "intel_pstate max_perf_pct, as a percentage.";
            };
            boost = lib.mkOption {
                type = lib.types.bool;
                default = true;
                description = "Allow turbo/boost.";
            };
        };
    };
in {
    flake.modules.nixos.power-options = {
        options.my.power = {
            cpu = {
                onAc = lib.mkOption {
                    type = cpuProfile;
                    default = {};
                    description = "CPU profile while on AC power.";
                };
                onBat = lib.mkOption {
                    type = cpuProfile;
                    default.epp = "power";
                    description = "CPU profile while on battery.";
                };
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

            zramPercent = lib.mkOption {
                type = lib.types.int;
                default = 50;
                description = "zramSwap.memoryPercent.";
            };

            chargeThreshold = {
                start = lib.mkOption {
                    type = lib.types.nullOr (lib.types.ints.between 0 100);
                    default = null;
                    description = "TLP START_CHARGE_THRESH_BAT0. null leaves it unset.";
                };
                end = lib.mkOption {
                    type = lib.types.nullOr (lib.types.ints.between 0 100);
                    default = null;
                    description = "TLP STOP_CHARGE_THRESH_BAT0. null leaves it unset.";
                };
            };

            swappiness = lib.mkOption {
                type = lib.types.int;
                default = 100;
                description = "vm.swappiness. Hosts that want a different value override it.";
            };

            hibernateDelaySec = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = ''
                    systemd Sleep.HibernateDelaySec. null disables hibernate, so
                    suspend-then-hibernate degrades to a plain suspend.
                '';
            };

            criticalPowerAction = lib.mkOption {
                type = lib.types.enum ["PowerOff" "Hibernate" "HybridSleep" "Suspend"];
                default = "PowerOff";
                description = "upower criticalPowerAction. Hibernate needs a boot.resumeDevice.";
            };
        };
    };
}
