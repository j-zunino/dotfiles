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

    hex = c: "#${c}";
    rgb = c: "rgb(${c})";
in {
    imports = [../nixos/stylix.nix];

    options.my.colors = lib.mkOption {
        type = lib.types.attrs;
        readOnly = true;
        default = {
            bg0 = lib.mkForce (rgb base00);
            bg1 = lib.mkForce (rgb base01);
            bg2 = lib.mkForce (rgb base02);
            gray1 = lib.mkForce (rgb base03);
            gray2 = lib.mkForce (rgb base04);
            fg = lib.mkForce (rgb base05);
            red = lib.mkForce (rgb base08);
            orange = lib.mkForce (rgb base09);
            yellow = lib.mkForce (rgb base0A);
            green = lib.mkForce (rgb base0B);
            aqua = lib.mkForce (rgb base0C);
            blue = lib.mkForce (rgb base0D);
            purple = lib.mkForce (rgb base0E);

            bg0-hex = hex base00;
            bg1-hex = hex base01;
            bg2-hex = hex base02;
            gray1-hex = hex base03;
            gray2-hex = hex base04;
            fg-hex = hex base05;
            red-hex = hex base08;
            orange-hex = hex base09;
            yellow-hex = hex base0A;
            green-hex = hex base0B;
            aqua-hex = hex base0C;
            blue-hex = hex base0D;
            purple-hex = hex base0E;

            accent = lib.mkForce (rgb base0B);
            accent-hex = hex base0B;
        };
    };

    config.stylix = {
        targets = {
            waybar.enable = false;
            neovim.enable = false;
            zen-browser.enable = false;
            fzf.enable = false;
            spicetify.enable = false;
        };

        iconTheme = {
            enable = true;
            package = pkgs.reversal-icon-theme;
            light = "Reversal";
            dark = "Reversal";
        };
    };
}
