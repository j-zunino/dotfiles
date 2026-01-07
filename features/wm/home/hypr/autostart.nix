{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings.exec-once =
        [
            "sleep 5"
            "wpaperd"
            "waybar"
            "hypridle"
            "wl-paste --watch cliphist store"
        ]
        ++ lib.optionals (hostname == "desktop") [
            "[workspace 4 silent] spotify"
            "webcord -m"
            "steam -silent"
            "hyprctl dispatch workspace 1"
        ]
        ++ lib.optionals (hostname == "latitude") [
            "[workspace 4 silent] spotify"
        ];
}
