{...}: {
    services.xserver.videoDrivers = ["nvidia"];
    programs.gpu-screen-recorder.enable = true;

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };

        nvidia = {
            open = true;
            nvidiaSettings = true;
            modesetting.enable = true;
            powerManagement = {
                enable = true;
                finegrained = false;
            };
        };
    };
}
