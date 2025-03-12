{pkgs, ...}: {
  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      protonup
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/juan/.steam/root/compatibilitytools.d";
    };
  };
}
