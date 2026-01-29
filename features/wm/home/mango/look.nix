{config, ...}: {
    wayland.windowManager.mango.settings = let
        colors = config.my.colors;
    in ''
        shadow_only_floating=0
        border_radius=0
        gappih=0
        gappiv=0
        gappoh=0
        gappov=0
        borderpx=2
        animations=0
        cursor_size=${toString config.stylix.cursor.size}

        rootcolor=0x${colors.bg1.hexNoPrefix}ff
        bordercolor=0x${colors.bg1.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        focuscolor=0x${colors.accent.hexNoPrefix}ff
        urgentcolor=0x${colors.red.hexNoPrefix}ff
    '';
}
