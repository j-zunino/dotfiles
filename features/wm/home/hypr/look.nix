{
    lib,
    config,
    ...
}: {
    wayland.windowManager.hyprland.settings = let
        colors = config.my.colors;
    in {
        master.new_status = "slave";
        animations.enabled = false;

        general = lib.mkMerge [
            {
                layout = "master";
                gaps_in = 0;
                gaps_out = 0;
                border_size = 2;
                resize_on_border = true;
                "col.active_border" = lib.mkForce colors.accent.rgb;
                "col.inactive_border" = lib.mkForce colors.bg1.rgb;
            }

            (lib.mkIf config.features.gaming.tweaks {
                allow_tearing = true;
            })
        ];

        decoration = {
            rounding = 0;
            shadow.enabled = false;

            blur = {
                enabled = true;
                size = 3;
                passes = 1;
                vibrancy = 0.2;
            };
        };

        misc = {
            force_default_wallpaper = 0;
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            animate_manual_resizes = true;
            focus_on_activate = true;
            # disable_hyprland_qtutils_check = true;
        };

        cursor = {
            no_warps = true;
            enable_hyprcursor = true;
        };
    };
}
