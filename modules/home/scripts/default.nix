{
    config,
    pkgs,
    ...
}: let
    rofi_logout = pkgs.writeScriptBin "rofi_logout" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/rofi/rofi_logout.sh
    '';
    rofi_clipboard = pkgs.writeScriptBin "rofi_clipboard" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/rofi/rofi_clipboard.sh
    '';
    rofi_tailwind = pkgs.writeScriptBin "tailwind" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/rofi/rofi_tailwind.sh
    '';
    battery_status = pkgs.writeScriptBin "battery_status" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/battery_status.sh
    '';
    network_status = pkgs.writeScriptBin "network_status" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/network_status.sh
    '';

    tmux_sessionizer = pkgs.writeScriptBin "tmux_sessionizer" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/tmux/tmux_sessionizer
    '';
in {
    home = {
        packages = [
            rofi_logout
            rofi_clipboard
            rofi_tailwind

            battery_status
            network_status
            tmux_sessionizer
        ];
    };
}
