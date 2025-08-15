{lib, ...}: {
    wayland.windowManager.hyprland = {
        settings = lib.mkAfter {
            # - [ MONITORS ] -
            monitor = [", preferred, auto, 1"];

            # - [ INPUTS ] -
            input = {
                kb_layout = "latam";
                kb_model = "latitude";
                kb_options = "caps:swapescape";

                touchpad = {
                    disable_while_typing = true;
                    natural_scroll = false;
                    scroll_factor = 0.5;
                    middle_button_emulation = true;
                };
            };
        };
    };
}
