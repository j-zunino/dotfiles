{...}: {
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
