{
    config,
    pkgs,
    ...
}: let
    rofi_logout = pkgs.writeScriptBin "rofi_logout" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/rofi_logout.sh
    '';
    rofi_clipboard = pkgs.writeScriptBin "rofi_clipboard" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/rofi_clipboard.sh
    '';
    rofi_tailwind = pkgs.writeScriptBin "tailwind" ''
        ${pkgs.stdenv.shell} ${config.home.homeDirectory}/dotfiles/modules/home/scripts/rofi_tailwind.sh
    '';
in {
    home = {
        packages = [
            rofi_logout
            rofi_clipboard
            rofi_tailwind
        ];
    };
}
