{
    pkgs,
    inputs,
    ...
}: {
    programs.chromium = {
        enable = true;
        package = pkgs.brave;

        extensions = [
            {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
            {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React developer tools
        ];
    };

    home.packages = with pkgs; [
        inputs.zen-browser.packages."${system}".default
    ];
}
