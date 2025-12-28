{
    hostname,
    stateVersion,
    ...
}: {
    imports = [
        ./${hostname}/configuration.nix
        ./${hostname}/hardware-configuration.nix
        ./${hostname}/features.nix
        ../features/nixos.nix
    ];

    networking.hostName = hostname;
    system.stateVersion = stateVersion;
}
