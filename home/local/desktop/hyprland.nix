{lib, ...}: {
    wayland.windowManager.hyprland = {
        settings = lib.mkAfter {
            env = [
                "LIBVA_DRIVER_NAME,nvidia"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            ];

            exec-once = [
                "hyprctl dispatch workspace 1"
                "hyprctl dispatch movecursor 960 540"
                "steam -silent"
                "[workspace 4 silent] spotify"
                "[workspace 4 silent] webcord"
            ];

            monitor = [
                "DP-1,1920x1080@60.00,0x0,1"
                "HDMI-A-1,1920x1080@60.00,-1920x0,1"
                ", preferred, auto, 1"
            ];

            workspace = [
                "1, monitor:DP-1, default:true"
                "4, monitor:HDMI-A-1, default:true"
            ];

            general = {
                allow_tearing = false;
            };

            "$mod" = "SUPER";
            "$mod_shift" = "SUPER_SHIFT";

            bind = [
                ", F8, exec, ~/dotfiles/home/modules/scripts/gpu_replay.sh toggle"
                ", F9, exec, ~/dotfiles/home/modules/scripts/gpu_replay.sh save"
            ];
        };
    };
}
