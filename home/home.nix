{
    homeStateVersion,
    hostname,
    user,
    ...
}: {
    imports = [
        ./${hostname}.nix
        ./modules
    ];

    nixpkgs.config.allowUnfree = true;

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
