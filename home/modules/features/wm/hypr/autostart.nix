{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings.exec-once =
        [
            # "sleep 5"
            "wpaperd"
            "waybar"
            "hypridle"
            "wl-paste --watch cliphist store"
        ]
        ++ lib.optionals (hostname == "desktop") [
            "steam -silent"
            "[workspace 4 silent] spotify"
            "[workspace 4 silent] webcord"
            "hyprctl dispatch workspace 1"
            "hyprctl dispatch movecursor 960 540"
        ]
        ++ lib.optionals (hostname == "latitude") [
            "[workspace 4 silent] spotify"
        ];
}
