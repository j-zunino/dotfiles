{...}: {
    wayland.windowManager.hyprland.settings = {
        gestures.workspace_swipe = false;

        input = {
            sensitivity = 0;
            accel_profile = "flat";
            follow_mouse = 1;

            kb_layout = "latam";
            repeat_rate = 40;
            repeat_delay = 300;
        };
    };
}
