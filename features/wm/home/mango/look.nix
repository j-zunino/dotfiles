{config, ...}: {
    wayland.windowManager.mango.settings = let
        colors = config.my.colors;
    in ''
        # Borders, gaps, shadows, opacity and cursor
        borderpx=0
        border_radius=0
        gappih=4
        gappiv=4
        gappoh=4
        gappov=4
        shadow_only_floating=0
        unfocused_opacity=0.95
        cursor_size=${toString config.stylix.cursor.size}

        # Colors
        rootcolor=0x${colors.bg1.hexNoPrefix}ff
        bordercolor=0x${colors.bg1.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        urgentcolor=0x${colors.red.hexNoPrefix}ff

        animations=1
        layer_animations=0
        animation_type_open=none
        animation_type_close=none
        layer_animation_type_open=none
        layer_animation_type_close=none
        animation_fade_in=0
        animation_fade_out=0
        animation_duration_move=200
        animation_curve_move=0.16,1,0.3,1
    '';
}
