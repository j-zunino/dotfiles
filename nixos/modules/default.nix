{
    lib,
    hostname,
    ...
}: {
    imports =
        [
            ./audio.nix
            ./env.nix
            ./home-manager.nix
            ./hyprland.nix
            ./networking.nix
            ./nix.nix
            ./user.nix
            ../stylix.nix
        ]
        ++ lib.optionals (hostname != "wsl") [
            ./boot.nix
        ];
}
