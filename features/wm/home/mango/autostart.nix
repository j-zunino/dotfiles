{
    lib,
    hostname,
    ...
}: {
    wayland.windowManager.mango.settings = lib.mkMerge [
        ''
            exec-once=waybar
            exec-once=wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)
            exec-once=wl-paste --watch cliphist store
        ''

        (lib.mkIf (hostname == "desktop") ''
            exec-once=spotify
            exec-once=webcord -m
            exec-once=steam -silent
        '')
    ];
}
