{...}: {
    flake.modules.nixos.kernel-zen = {pkgs, ...}: {
        boot.kernelPackages = pkgs.linuxPackages_zen;
    };
}
