{
    hostname,
    stateVersion,
    ...
}: {
    imports = [
        ../features/nixos.nix
        ./${hostname}/configuration.nix
        ./${hostname}/features.nix
        ./${hostname}/hardware-configuration.nix
    ];

    networking.hostName = hostname;
    system.stateVersion = stateVersion;
}
