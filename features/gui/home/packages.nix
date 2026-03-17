{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gui.packages {
        home.packages = with pkgs; [
            # discord
            webcord
            showmethekey
            gimp
            stremio-linux-shell
            vlc
            gparted
        ];
    };
}
