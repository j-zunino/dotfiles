{
    homeStateVersion,
    hostname,
    user,
    ...
}: {
    imports = [
        ./base-packages.nix
        ./local/${hostname}
        ./modules
    ];

    home = {
        username = user;
        homeDirectory = "/home/${user}";

        stateVersion = homeStateVersion;

        sessionVariables = {
            EDITOR = "nvim";
            BROWSER = "brave";
        };
    };
}
