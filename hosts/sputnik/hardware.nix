{
    flake.modules.nixos.sputnik = {
        modulesPath,
        config,
        pkgs,
        lib,
        ...
    }: {
        imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "usb_storage" "rtsx_usb_sdmmc"];
        boot.initrd.kernelModules = [];
        boot.kernelModules = ["kvm-intel"];
        boot.extraModulePackages = [];

        fileSystems."/" = {
            device = "/dev/disk/by-uuid/1b34a6dd-60cd-4d1e-adb3-82a56fd8f084";
            fsType = "ext4";
        };

        fileSystems."/boot" = {
            device = "/dev/disk/by-uuid/E708-2B55";
            fsType = "vfat";
            options = ["fmask=0077" "dmask=0077"];
        };

        swapDevices = [];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
