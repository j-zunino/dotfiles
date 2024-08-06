{ config, lib, pkgs, ... }:

let
  customLayout = pkgs.writeText "xkb-layout" ''
    keycode  67 = XF86AudioMute
    keycode  68 = XF86AudioLowerVolume
    keycode  69 = XF86AudioRaiseVolume
    keycode  72 = XF86MonBrightnessDown
    keycode  73 = XF86MonBrightnessUp
    '';
in {
  services.xserver.displayManager.sessionCommands = "sleep 5 && ${pkgs.xorg.xmodmap}/bin/xmodmap ${customLayout}";
}
