{
    lib,
    config,
    hostname,
    ...
}: {
    wayland.windowManager.mango.settings = lib.mkMerge [
        ''
            exec-once=waybar
            exec-once=wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)
            exec-once=wl-paste --watch cliphist store
        ''

        (lib.mkIf (config.features.gaming.steam) ''exec-once=steam -silent'')

        (lib.mkIf (hostname == "desktop") ''
            exec-once=spotify
            exec-once=webcord -m
        '')
    ];
}
