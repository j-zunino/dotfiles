{ config, ... }:

{
  services = {
    dunst = {
      enable = true;
      configFile = ./dunst/dunstrc
    };
  };
}
