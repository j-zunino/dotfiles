{config, ...}: let
    colors = config.my.colors;
in {
    wayland.windowManager.hyprland.settings = {
        master.new_status = "slave";
        animations.enabled = false;

        general = {
            layout = "master";
            gaps_in = 0;
            gaps_out = 0;
            border_size = 2;
            # allow_tearing = false;
            resize_on_border = true;

            "col.active_border" = colors.accent;
            "col.inactive_border" = colors.bg1;
        };

        decoration = {
            rounding = 0;
            # dim_inactive = true;
            # dim_strength = 0.05;
            # active_opacity = 1.0;
            # inactive_opacity = 1.0;
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
