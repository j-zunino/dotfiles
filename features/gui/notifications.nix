{
    lib,
    config,
    ...
}: let
    colors = config.my.colors;
    stylixFonts = config.stylix.fonts;
in {
    config = lib.mkIf config.features.gui.notifications {
        services.mako = {
            enable = true;
            settings = lib.mkForce {
                default-timeout = 25000;
                font = "${stylixFonts.monospace.name} ${toString stylixFonts.sizes.popups}";
                text-color = colors.fg.hex;
                background-color = colors.bg1.hex;
                border-size = 1;
                border-color = colors.gray1.hex;
                progress-color = "source ${colors.bg2.hex}";

                "urgency=critical" = {
                    border-size = 2;
                    border-color = colors.red.hex;
                };
            };
        };
    };
}
