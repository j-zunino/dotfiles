{inputs, ...}: {
    flake.modules.homeManager.spotify = {pkgs, ...}: let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
        imports = [inputs.spicetify-nix.homeManagerModules.default];

        programs.spicetify = {
            enable = true;
            enabledExtensions = with spicePkgs.extensions; [
                hidePodcasts
            ];

            theme = spicePkgs.themes.text;
            colorScheme = "EverforestDarkMedium";
        };
    };
}
