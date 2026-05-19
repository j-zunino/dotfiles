{...}: {
    flake.modules.nixos.kernel-zen = {pkgs, ...}: {
        boot.kernelPackages = pkgs.linuxPackages_zen;
    };

    flake.modules.nixos.kernel-xanmod = {pkgs, ...}: {
        boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
    };
}
