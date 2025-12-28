{
    pkgs,
    inputs,
    ...
}: {
    imports = [inputs.home-manager.nixosModules.default];
    environment.systemPackages = with pkgs; [home-manager];
    home-manager.backupFileExtension = "backup";
}
