{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings.exec-once =
        [
            "wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)"
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
