{
  pkgs,
  inputs,
  ...
}: {
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
      {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React developer tools
    ];
    package = pkgs.brave;
  };

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];
}
