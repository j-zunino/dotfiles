{
    pkgs,
    inputs,
    ...
}: {
    boot = {
        kernelPackages = pkgs.linuxPackages_xanmod_latest;

        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    services.greetd = let
        tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
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
}
