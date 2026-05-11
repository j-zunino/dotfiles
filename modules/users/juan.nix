{...}: {
  flake.modules.nixos.users-juan = {pkgs, ...}: {
    users.users.juan = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      initialPassword = "password";
      shell = pkgs.zsh;
    };
  };

  flake.modules.homeManager.users-juan = {
    home = {
      username = "juan";
      homeDirectory = "/home/juan";
      stateVersion = "24.05";
    };
  };
}
