{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.hyprland.settings = {
        xwayland.force_zero_scaling = true;
        ecosystem.no_update_news = true;

        env =
            [
                "NIXOS_OZONE_WL,1"
                "GDK_BACKEND,wayland"
                "QT_QPA_PLATFORM,wayland"
                "QT_STYLE_OVERRIDE,kvantum"
                "SDL_VIDEODRIVER,wayland"
                "MOZ_ENABLE_WAYLAND,1"
                "ELECTRON_OZONE_PLATFORM_HINT,wayland"
                "OZONE_PLATFORM,wayland"
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
            ]
            ++ lib.optionals (hostname == "desktop") [
                "LIBVA_DRIVER_NAME,nvidia"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            ];
    };
}
