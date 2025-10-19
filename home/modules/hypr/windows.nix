{...}: {
    wayland.windowManager.hyprland.settings = {
        windowrulev2 = [
            "float, class:^(floating)$"
            "immediate, class:^(cs2)$"
            "immediate, class:^(overwatch\.exe)$"
        ];
    };
}
