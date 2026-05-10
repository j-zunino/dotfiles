{inputs, ...}: {
  flake.modules.nixos.home-manager = {pkgs, ...}: {
    imports = [inputs.home-manager.nixosModules.home-manager];
    environment.systemPackages = with pkgs; [home-manager];
  };
}
