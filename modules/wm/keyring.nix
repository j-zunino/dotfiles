{...}: {
    flake.modules.nixos.keyring = {...}: {
        services.gnome.gnome-keyring.enable = true;
    };

    flake.modules.homeManager.keyring = {pkgs, ...}: {
        home.packages = with pkgs; [
            seahorse
        ];
    };
}
