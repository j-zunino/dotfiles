{
    homeStateVersion,
    hostname,
    user,
    lib,
    ...
}: {
    imports =
        [
            ./home-packages.nix
            ./modules
        ]
        ++ lib.optionals (hostname == "desktop") [
            ./local/desktop
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
