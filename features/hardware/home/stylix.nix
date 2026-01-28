{
    config,
    pkgs,
    lib,
    ...
}: let
    color = config.lib.stylix.colors;

    inherit
        (color)
        base00
        base01
        base02
        base03
        base04
        base05
        base08
        base09
        base0A
        base0B
        base0C
        base0D
        base0E
        ;

    mkColor = c: {
        raw = c;
        hex = "#${c}";
        hexNoPrefix = c;
        rgb = "rgb(${c})";
    };
in {
    imports = [../nixos/stylix.nix];

    options.my.colors = lib.mkOption {
        type = lib.types.attrs;
        readOnly = true;
        default = {
            bg0 = mkColor base00;
            bg1 = mkColor base01;
            bg2 = mkColor base02;
            gray1 = mkColor base03;
            gray2 = mkColor base04;
            fg = mkColor base05;
            red = mkColor base08;
            orange = mkColor base09;
            yellow = mkColor base0A;
            green = mkColor base0B;
            aqua = mkColor base0C;
            blue = mkColor base0D;
            purple = mkColor base0E;

            accent = mkColor base0B;
        };
    };

    config.stylix = {
        targets = {
            waybar.enable = false;
            neovim.enable = false;
            zen-browser.enable = false;
            fzf.enable = false;
            spicetify.enable = false;
            lazygit.enable = false;
        };

        iconTheme = {
            enable = true;
            package = pkgs.reversal-icon-theme;
            light = "Reversal";
            dark = "Reversal";
        };
    };
}
