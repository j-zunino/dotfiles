{pkgs, ...}: let
    rofi_logout = pkgs.writeScriptBin "rofi_logout" ''${pkgs.stdenv.shell} $HOME/dotfiles/home/modules/scripts/rofi/rofi_logout.sh'';
    rofi_clipboard = pkgs.writeScriptBin "rofi_clipboard" ''${pkgs.stdenv.shell} $HOME/dotfiles/home/modules/scripts/rofi/rofi_clipboard.sh'';
    gpu_replay = pkgs.writeScriptBin "gpu_replay" ''${pkgs.stdenv.shell} $HOME/dotfiles/home/modules/scripts/gpu_replay.sh'';
    toggle_floating = pkgs.writeScriptBin "toggle_floating" ''${pkgs.stdenv.shell} $HOME/dotfiles/home/modules/scripts/toggle_floating.sh'';
    tmux_sessionizer = pkgs.writeScriptBin "tmux_sessionizer" ''${pkgs.stdenv.shell} $HOME/dotfiles/home/modules/scripts/tmux/tmux_sessionizer'';
in {
    home = {
        packages = [
            rofi_logout
            rofi_clipboard
            gpu_replay
            toggle_floating
            tmux_sessionizer
        ];
    };
}
