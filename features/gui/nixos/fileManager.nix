{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf config.features.gui.fileManager.thunar {
            services = {
                gvfs.enable = true;
                tumbler.enable = true;
            };

            programs.thunar = {
                enable = true;
                plugins = with pkgs; [thunar-vcs-plugin thunar-archive-plugin];
            };

            environment.systemPackages = with pkgs; [
                xarchiver
            ];
        })
    ];
}
