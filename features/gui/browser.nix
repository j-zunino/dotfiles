{
    lib,
    pkgs,
    config,
    inputs,
    ...
}: {
    config = lib.mkMerge [
        (lib.mkIf config.features.gui.browser.zen {
            home.packages = [
                inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
            ];
        })

        (lib.mkIf config.features.gui.browser.brave {
            programs.brave = {
                enable = true;
                extensions = [
                    {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
                    {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React developer tools
                    {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
                    {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # Dark reader
                    {id = "edibdbjcniadpccecjdfdjjppcpchdlm";} # I still don't care about cookies
                ];
            };
        })
    ];
}
