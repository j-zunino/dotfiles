{
    lib,
    pkgs,
    inputs,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkif (config.features.hardware.dualboot == false) {
            boot.loader = {
                efi.canTouchEfiVariables = true;
                systemd-boot.enable = true;
            };
        })

        (lib.mkIf config.features.hardware.dualboot {
            boot.loader = {
                grub = {
                    enable = true;
                    efiSupport = true;
                    useOSProber = true;
                    device = "nodev";
                };
            };
        })

        (lib.mkIf config.features.hardware.greetd {
            services.greetd = let
                tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
                hyprland = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
            in {
                enable = true;
                settings.default_session.command = "${tuigreet} --time --remember --remember-user-session --cmd ${hyprland} --theme 'border=green'";
            };

            systemd.services.greetd.serviceConfig = {
                Type = "idle";
                StandardInput = "tty";
                StandardOutput = "tty";
                # without this errors will spam on screen
                StandardError = "journal";
                # without these bootlogs will spam on screen
                TTYReset = true;
                TTYVHangup = true;
                TTYVTDisallocate = true;
            };
        })
    ];
}
