{
    homeStateVersion,
    hostname,
    user,
    ...
}: {
    imports = [
        ./${hostname}/features.nix
        ../features/home.nix
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
