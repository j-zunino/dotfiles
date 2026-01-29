{
    lib,
    config,
    inputs,
    ...
}: {
    imports = [
        inputs.mango.hmModules.mango
        ./look.nix
        ./binds.nix
    ];

    config = lib.mkIf config.features.wm.mango {
        wayland.windowManager.mango = {
            enable = true;
            settings = ''
                exec-once=waybar
                exec-once=wbg -s $(find ~/dotfiles/wallpapers -type f | shuf -n 1)
                exec-once=wl-paste --watch cliphist store

                new_is_master=0
                circle_layout=tile,scroller,vertical_scroller

                repeat_rate=40
                repeat_delay=300
                xkb_rules_layout=latam
                xkb_rules_options=caps:escape

                allow_tearing=2
                accel_profile=0
                warpcursor=0
                drag_corner=4
                drag_warp_cursor=0
                drag_tile_to_tile=1
            '';
        };
    };
}
