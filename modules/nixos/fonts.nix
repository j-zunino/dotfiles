{ pkgs, ... }:

{
    fonts.packages = with pkgs.nerd-fonts; [
        jetbrainsmono
        commitmono
        cascadiacode
        iosevkaterm
    ];
}
