{config, ...}: {
    services.xserver.videoDrivers = ["nvidia"];
    programs.gpu-screen-recorder.enable = true;

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
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
