{inputs, ...}: {
  flake.modules.homeManager.zen = {pkgs, ...}: {
    home.packages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  flake.modules.homeManager.helium = {pkgs, ...}: {
    home.packages = [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
