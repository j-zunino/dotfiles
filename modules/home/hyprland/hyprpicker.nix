{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      hyprpicker
      wl-clipboard
    ];
  };
}
