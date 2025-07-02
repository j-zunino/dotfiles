{
    pkgs,
    inputs,
    ...
}: {
    programs.brave = {
        enable = true;
        extensions = [
            {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
            {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React developer tools
            {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
        ];
    };

    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default
    ];
}
