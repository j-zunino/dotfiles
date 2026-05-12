{inputs, ...}: {
    flake.modules.nixos.home-manager = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [home-manager];
    };
}
