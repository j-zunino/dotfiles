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

    system.stateVersion = stateVersion;
}
