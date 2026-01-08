{
    lib,
    pkgs,
    inputs,
    config,
    ...
}: {
    config = lib.mkIf config.features.wm.hyprland {
        programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
        };
    };
}
