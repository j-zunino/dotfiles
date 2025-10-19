{lib, ...}: {
    wayland.windowManager.hyprland = {
        settings = lib.mkAfter {
            exec-once = [
                "hyprctl dispatch workspace 1"
                "hyprctl dispatch movecursor 960 540"
                "steam -silent"
                "spotify"
                "[workspace 4 silent] webcord"
            ];

            monitor = [
                "DP-1,1920x1080@60.00,0x0,1"
                "HDMI-A-1,1920x1080@60.00,-1920x0,1"
                ", preferred, auto, 1"
            ];

            workspace = [
                "1, monitor:DP-1, default:true"
                "9, monitor:HDMI-A-1, default:true"
            ];

            input = {
                kb_layout = "latam";
                kb_model = "latitude";
                # kb_options = "caps:swapescape";
                repeat_delay = 300;

                sensitivity = 0;
            };
        };
    };
}
