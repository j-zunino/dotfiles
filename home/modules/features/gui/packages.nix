{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.gui.packages {
        home.packages = with pkgs; [
            # discord
            nautilus
            webcord
        ];
    };
}
