{...}: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "sleep 5"
        "waybar"
        "wpaperd"
        "hypridle"
        "syshud -p bottom -i 24 -m 5"
        "wl-paste --watch cliphist store"
    ];
}
