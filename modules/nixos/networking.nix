{...}: {
  networking = {
    hostName = "nixos";

    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    # wireless.enable = true; # Enables wireless support via wpa_supplicant
  };
}
