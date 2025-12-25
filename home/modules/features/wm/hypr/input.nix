{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings.input = lib.mkMerge [
        {
            sensitivity = 0;
            accel_profile = "flat";
            follow_mouse = 1;

            kb_layout = "latam";
            repeat_rate = 40;
            repeat_delay = 300;
        }

        (lib.mkIf (hostname == "latitude") {
            kb_model = "latitude";
            kb_options = "caps:swapescape";

            touchpad = {
                disable_while_typing = true;
                natural_scroll = false;
                scroll_factor = 0.5;
                middle_button_emulation = true;
            };
        })
    ];
}
