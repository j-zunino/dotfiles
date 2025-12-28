{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings.exec-once =
        [
            "sleep 4"
            "wpaperd"
            "waybar"
            "hypridle"
            "wl-paste --watch cliphist store"
        ]
        ++ lib.optionals (hostname == "desktop") [
            "steam -silent"
            "[workspace 4 silent] spotify"
            "[workspace 4 silent] webcord"
            "sleep 2"
            "hyprctl dispatch workspace 1"
        ]
        ++ lib.optionals (hostname == "latitude") [
            "[workspace 4 silent] spotify"
        ];
}
