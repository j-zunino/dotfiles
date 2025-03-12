{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono
    nerd-fonts.iosevka-term
  ];
}
