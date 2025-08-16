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
        settings = lib.mkForce {
            default-timeout = 25000;
            font = "${stylixFonts.monospace.name} ${toString stylixFonts.sizes.popups}";
            text-color = colors.fg-hex;
            background-color = colors.bg1-hex;
            border-color = colors.accent-hex;
            progress-color = "source ${colors.bg1-hex}";
        };
    };
}
