{
    hostname,
    stateVersion,
    ...
}: {
    imports = [
        ./${hostname}/configuration.nix
        ./${hostname}/hardware-configuration.nix
        ../../nixos/modules
        ./modules
    ];

    networking.hostName = hostname;
    system.stateVersion = stateVersion;
}
