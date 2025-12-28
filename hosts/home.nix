{
    homeStateVersion,
    hostname,
    user,
    ...
}: {
    imports = [
        ../features/home.nix
        ./${hostname}/features.nix
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
