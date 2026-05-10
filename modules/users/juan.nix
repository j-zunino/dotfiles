{self, ...}: {
  flake.modules.nixos.juan = {pkgs, ...}: {
    users.users.juan = {
      isNorrmalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      initialPassword = "password";
    };
  };
}
