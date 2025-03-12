{pkgs, ...}: {
  services = {
    displayManager = {
      defaultSession = "hyprland";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # xorg.libX11
      # xorg.xbacklight
      brightnessctl
      playerctl
    ];
  };
}
