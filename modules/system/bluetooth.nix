{...}: {
    flake.modules.nixos.bluetooth = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [bluetui];
        hardware.bluetooth.enable = true;
        services.blueman.enable = true;
    };
}
