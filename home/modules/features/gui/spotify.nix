{
    lib,
    pkgs,
    inputs,
    config,
    ...
}: {
    config = let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
        lib.mkIf config.features.gui.spotify {
            imports = [inputs.spicetify-nix.homeManagerModules.default];

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
