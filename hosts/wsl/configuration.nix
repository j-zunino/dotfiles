{
    stateVersion,
    hostname,
    inputs,
    ...
}: {
    imports = [
        ../../nixos/modules
        ./modules
        "${inputs.nixos-wsl}/modules"
    ];

    networking.hostName = hostname;

    wsl = {
        enable = true;
        defaultUser = "juan";
    };

    system.stateVersion = stateVersion;
}
