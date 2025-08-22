{
    lib,
    hostname,
    ...
}: {
    imports =
        [
            ./env.nix
            ./home-manager.nix
            ./nix.nix
            ./user.nix
            ../stylix.nix
        ]
        ++ lib.optionals (hostname != "wsl") [
            ./boot.nix
            ./audio.nix
            ./networking.nix
            ./hyprland.nix
        ];
}
