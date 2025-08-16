{
    config,
    lib,
    ...
}: let
    colors = config.my.colors;
    stylixFonts = config.stylix.fonts;
in {
    services.mako = {
        enable = true;
        settings = {
            default-timeout = 25000;
            font = lib.mkForce "${stylixFonts.monospace.name} ${toString stylixFonts.sizes.popups}";
            text-color = lib.mkForce colors.fg-hex;
            background-color = lib.mkForce colors.bg0-hex;
            border-color = lib.mkForce colors.accent-hex;
            progress-color = lib.mkForce "source ${colors.bg1-hex}";
        };
    };
}
