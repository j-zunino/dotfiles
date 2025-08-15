{
    stateVersion,
    hostname,
    ...
}: {
    imports = [
        ./hardware-configuration.nix
        ../../nixos/modules
        ./modules
    ];

    networking.hostName = hostname;

    fileSystems."/mnt/toshiba" = {
        # 2b4cd237-785d-4eb9-bdef-9fb799c991cb
        device = "/dev/disk/by-uuid/2b4cd237-785d-4eb9-bdef-9fb799c991cb";
        fsType = "ext4";
    };

    system.stateVersion = stateVersion;
}
