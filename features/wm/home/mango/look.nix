{config, ...}: {
    wayland.windowManager.mango.settings = let
        colors = config.my.colors;
    in ''
        shadow_only_floating=0
        animations=0
        unfocused_opacity=0.95
        border_radius=0
        gappih=4
        gappiv=4
        gappoh=4
        gappov=4
        borderpx=0
        cursor_size=${toString config.stylix.cursor.size}
        rootcolor=0x${colors.bg1.hexNoPrefix}ff
        bordercolor=0x${colors.bg1.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        urgentcolor=0x${colors.red.hexNoPrefix}ff
    '';
}
