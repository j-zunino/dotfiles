{
    config,
    pkgs,
    ...
}: let
    dm-logout = pkgs.writeScriptBin "logout" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/logout.sh
    '';
    dm-clipboard = pkgs.writeScriptBin "clipboard" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/clipboard.sh
    '';
    dm-tailwind = pkgs.writeScriptBin "tailwind" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/tailwind.sh
    '';
in {
    home = {
        packages = [
            dm-logout
            dm-clipboard
            dm-tailwind
        ];
    };
}
