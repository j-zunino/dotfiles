{
    lib,
    config,
    inputs,
    ...
}: {
    imports = [
        inputs.mango.hmModules.mango
        ./autostart.nix
        ./binds.nix
        ./look.nix
    ];

    config = lib.mkIf config.features.wm.mango {
        wayland.windowManager.mango = {
            enable = true;
            settings = ''

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
