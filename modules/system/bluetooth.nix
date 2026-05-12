{...}: {
    flake.modules.nixos.bluethooth = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [bluetui];
        hardware.bluetooth.enable = true;
        services.blueman.enable = true;
    };
}
