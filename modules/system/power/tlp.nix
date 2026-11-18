{
    inputs,
    lib,
    ...
}: let
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
    flake.modules.generic.power-tlp = {
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
        };
    };

    flake.modules.nixos.power-tlp = {
        config,
        lib,
        pkgs,
        ...
    }: let
        cpu = profile: state: {
            "CPU_SCALING_GOVERNOR_ON_${state}" = profile.governor;
            "CPU_ENERGY_PERF_POLICY_ON_${state}" = profile.epp;
            "CPU_MAX_PERF_ON_${state}" = profile.maxPerfPct;
            "CPU_BOOST_ON_${state}" =
                if profile.boost
                then 1
                else 0;
        };
    in {
        imports = [inputs.self.modules.generic.power-tlp];

        services.tlp = {
            enable = true;
            settings =
                cpu config.my.power.cpu.onAc "AC"
                // cpu config.my.power.cpu.onBat "BAT"
                // {
                    SATA_LINKPWR_ON_AC = "med_power_with_dipm";
                    SATA_LINKPWR_ON_BAT = "min_power";

                    WIFI_PWR_ON_AC = "off";
                    WIFI_PWR_ON_BAT = "on";

                    PCIE_ASPM_ON_AC = "default";
                    PCIE_ASPM_ON_BAT = "powersupersave";

                    # HID is not excluded on purpose: autosuspending the touchpad or
                    # keyboard on this laptop causes missed input.
                    USB_AUTOSUSPEND = 1;
                    USB_EXCLUDE_AUDIO = 1;

                    RUNTIME_PM_ON_AC = "on";
                    RUNTIME_PM_ON_BAT = "auto";
                }
                // lib.optionalAttrs (config.my.power.chargeThreshold.start != null) {
                    START_CHARGE_THRESH_BAT0 = config.my.power.chargeThreshold.start;
                }
                // lib.optionalAttrs (config.my.power.chargeThreshold.end != null) {
                    STOP_CHARGE_THRESH_BAT0 = config.my.power.chargeThreshold.end;
                };
        };

        # Measure with powertop; do not enable powerManagement.powertop, it
        # would fight TLP over the same sysfs knobs.
        environment.systemPackages = [pkgs.powertop];
    };
}
