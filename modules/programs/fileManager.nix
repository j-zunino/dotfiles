{...}: {
    flake.modules.nixos.fileManager = {pkgs, ...}: {
        services = {
            gvfs.enable = true;
            tumbler.enable = true;
        };

        programs.thunar = {
            enable = true;
            plugins = with pkgs; [thunar-vcs-plugin thunar-archive-plugin];
        };

        environment.systemPackages = with pkgs; [xarchiver];
    };
}
