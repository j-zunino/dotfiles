{
  config,
  pkgs,
  ...
}: let
  dm-wifi = pkgs.writeScriptBin "dm-wifi" ''
    ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/dm-wifi.sh
  '';
  dm-logout = pkgs.writeScriptBin "dm-logout" ''
    ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/dm-logout.sh
  '';
in {
  home = {
    packages = [
      dm-wifi
      dm-logout
    ];
  };
}
