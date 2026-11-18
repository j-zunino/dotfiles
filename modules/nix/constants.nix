{lib, ...}: let
    mkColor = color: {
        raw = color;
        hex = "#${color}";
        hexNoPrefix = color;
        rgb = "rgb(${color})";
    };

    mkColors = config: let
        c = config.lib.stylix.colors;
    in {
        bg = mkColor c.base00;
        surface = mkColor c.base01;
        overlay = mkColor c.base02;
        muted = mkColor c.base03;
        subtle = mkColor c.base04;
        fg = mkColor c.base05;
        red = mkColor c.base08;
        orange = mkColor c.base09;
        yellow = mkColor c.base0A;
        green = mkColor c.base0B;
        aqua = mkColor c.base0C;
        blue = mkColor c.base0D;
        purple = mkColor c.base0E;
        accent = mkColor c.base0B;
    };
in {
    flake.modules.generic.colors = {config, ...}: {
        options.my.colors = lib.mkOption {
            type = lib.types.attrs;
            readOnly = true;
        };

        config.my.colors = mkColors config;
    };
}
