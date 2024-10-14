{ config, pkgs, ... }:
let
    dm-hub = pkgs.writeScriptBin "dm-hub" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/dm-hub.sh
    '';
    dm-wifi = pkgs.writeScriptBin "dm-wifi" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/dm-wifi.sh
    '';
    dm-logout = pkgs.writeScriptBin "dm-logout" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/dm-logout.sh
    '';
in
{
    home = {
        packages = [
            dm-hub
            dm-wifi
            dm-logout
        ];
    };
}

