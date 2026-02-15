{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.wm.packages {
        home.packages = with pkgs; [
            hyprpicker
            hyprshot
            wl-clipboard
            cliphist
            wbg
        ];
    };
}
