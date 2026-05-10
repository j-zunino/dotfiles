{...}: {
  flake.modules.nixos.users-juan = {
    users.users.juan = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      initialPassword = "password";
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
