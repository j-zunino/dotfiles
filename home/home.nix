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
        ]
        ++ lib.optionals (hostname == "latitude") [
            ./local/latitude
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
