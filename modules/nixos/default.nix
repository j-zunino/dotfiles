{
  imports = [
    ./boot/bootloader.nix
    ./xserver/xserver.nix
    ./window-managers/default.nix
    ./network/networking.nix
    ./services/default.nix
    ./common.nix
    ./fonts.nix
    ./gaming.nix
    ./ly.nix
    ../stylix.nix
  ];
}
