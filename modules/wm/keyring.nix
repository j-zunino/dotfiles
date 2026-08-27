{...}: {
    flake.modules.nixos.keyring = {...}: {
        services.gnome.gnome-keyring.enable = true;
        security.pam.services.login.enableGnomeKeyring = true;
    };

    flake.modules.homeManager.keyring = {pkgs, ...}: {
        home.packages = with pkgs; [
            seahorse
        ];
    };
}
