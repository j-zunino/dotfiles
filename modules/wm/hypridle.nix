{lib, ...}: {
    flake.modules.homeManager.hypridle = {config, ...}: {
        options.my.idle = {
            dpmsOffSec = lib.mkOption {
                type = lib.types.int;
                default = 300;
                description = "Seconds of inactivity before the panel is powered off.";
            };
            suspendSec = lib.mkOption {
                type = lib.types.nullOr lib.types.int;
                default = 900;
                description = "Seconds before suspend; null disables idle suspend.";
            };
            suspendCommand = lib.mkOption {
                type = lib.types.str;
                default = "systemctl suspend";
                description = ''
                    Command run at the suspend timeout. Hosts with a configured
                    boot.resumeDevice can use suspend-then-hibernate instead.
                '';
            };
        };

        config.services.hypridle = {
            enable = true;
            # Must match the target this repo starts in hyprland.lua, otherwise
            # the unit has no graph to attach to.
            systemdTarget = "hyprland-session.target";
            settings = {
                general = {
                    before_sleep_cmd = "hyprctl dispatch dpms off";
                    after_sleep_cmd = "hyprctl dispatch dpms on";
                };
                listener =
                    [
                        {
                            timeout = config.my.idle.dpmsOffSec;
                            on-timeout = "hyprctl dispatch dpms off";
                            on-resume = "hyprctl dispatch dpms on";
                        }
                    ]
                    ++ lib.optional (config.my.idle.suspendSec != null) {
                        timeout = config.my.idle.suspendSec;
                        on-timeout = config.my.idle.suspendCommand;
                    };
            };
        };
    };
}
