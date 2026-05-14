{inputs, ...}: {
    flake.modules.nixos.hyprland = {
        programs.hyprland.enable = true;
        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        nix.settings = {
            substituters = ["https://hyprland.cachix.org"];
            trusted-substituters = ["https://hyprland.cachix.org"];
            trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };
    };

    flake.modules.homeManager.hyprland = {pkgs, ...}: {
        wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

            configType = "lua";
            extraConfig = '''';
        };

        xdg.configFile."hypr".source = ./hypr;
    };
}
