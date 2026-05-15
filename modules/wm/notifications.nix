{...}: {
    flake.modules.homeManager.notifications = {pkgs, ...}: {
        home.packages = with pkgs; [
            libnotify
        ];

        services.mako = {
            enable = true;
            settings = {
                default-timeout = 25000;
                border-size = 1;

                "urgency=critical" = {
                    border-size = 2;
                };
            };
        };
    };

    flake.modules.homeManager.stylix = {
        config,
        lib,
        ...
    }: let
        colors = config.my.colors;
        stylixFonts = config.stylix.fonts;
    in {
        services.mako.settings = lib.mkForce {
            font = "${stylixFonts.monospace.name} ${toString stylixFonts.sizes.popups}";
            text-color = colors.fg.hex;
            background-color = colors.bg1.hex;
            border-color = colors.gray1.hex;
            progress-color = "source ${colors.bg2.hex}";

            "urgency=critical" = {
                border-color = colors.red.hex;
            };
        };
    };
}
