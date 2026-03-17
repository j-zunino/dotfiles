{
    lib,
    pkgs,
    inputs,
    config,
    ...
}: let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
    imports = [inputs.spicetify-nix.homeManagerModules.default];

    config = lib.mkIf config.features.gui.spotify {
        programs.spicetify = {
            enable = true;
            enabledExtensions = with spicePkgs.extensions; [
                # adblock
                hidePodcasts
            ];

            theme = spicePkgs.themes.text;
            colorScheme = "EverforestDarkMedium";
        };
    };
}
