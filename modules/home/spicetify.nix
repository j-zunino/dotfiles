{ pkgs, lib, spicetify-nix, ... }:

let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
    imports = [
        spicetify-nix.homeManagerModules.default
    ];

    programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts
        ];

        theme = spicePkgs.themes.text;
        colorScheme = "text";
    };
}
