{
    lib,
    pkgs,
    inputs,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf (!config.features.hardware.dualboot) {
            boot.loader = {
                efi.canTouchEfiVariables = true;
                systemd-boot.enable = true;
            };
        })

        (lib.mkIf config.features.hardware.dualboot {
            boot.loader = {
                systemd-boot.enable = false;
                grub = {
                    enable = true;
                    efiSupport = true;
                    useOSProber = true;
                    devices = ["nodev"];
                };
            };
        })

        (lib.mkIf config.features.hardware.greetd {
            services.greetd = let
                tuigreet = lib.getExe pkgs.tuigreet;
                hyprland = lib.getExe inputs.hyprland.packages.${pkgs.system}.hyprland;
            in {
                enable = true;
                settings.default_session.command = "${tuigreet} --time --remember --remember-user-session --cmd ${hyprland} --theme 'border=green'";
            };

            systemd.services.greetd.serviceConfig = {
                Type = "idle";
                StandardInput = "tty";
                StandardOutput = "tty";
                StandardError = "journal";
                TTYReset = true;
                TTYVHangup = true;
                TTYVTDisallocate = true;
            };
        })
    ];
}
