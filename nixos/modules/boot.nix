{pkgs, ...}: {
    boot = {
        kernelPackages = pkgs.linuxPackages_xanmod_latest;

        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    services.displayManager.ly = {
        enable = true;
        settings = {
            save = true;
            clear_password = true;
            animation = "matrix";
        };
    };
}
