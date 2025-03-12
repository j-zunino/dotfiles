{...}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # wireless.enable = true; # Enables wireless support via wpa_supplicant
  };
}
