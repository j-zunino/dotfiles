{config, ...}: {
    services.xserver.videoDrivers = ["nvidia"];
    hardware = {
        graphics = {
            enable = true;
        };

        nvidia = {
            modesetting.enable = true;
            powerManagement.finegrained = false;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.latest;
        };
    };
}
