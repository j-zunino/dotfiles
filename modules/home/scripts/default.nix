{pkgs, ...}: let
    tmux_sessionizer = pkgs.writeScriptBin "tmux_sessionizer" ''
        ${pkgs.stdenv.shell} $HOME/dotfiles/modules/home/scripts/tmux/tmux_sessionizer
    '';
in {
    home = {
        packages = [
            tmux_sessionizer
        ];
    };
}
