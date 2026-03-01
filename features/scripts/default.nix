{pkgs, ...}: let
    osd_volumen = pkgs.writeScriptBin "osd_volumen" ''${pkgs.stdenv.shell} $HOME/dotfiles/features/scripts/osd/volumen'';
    osd_brightness = pkgs.writeScriptBin "osd_brightness" ''${pkgs.stdenv.shell} $HOME/dotfiles/features/scripts/osd/brightness'';
    gpu_replay = pkgs.writeScriptBin "gpu_replay" ''${pkgs.stdenv.shell} $HOME/dotfiles/features/scripts/gpu_replay.sh'';
    toggle_floating = pkgs.writeScriptBin "toggle_floating" ''${pkgs.stdenv.shell} $HOME/dotfiles/features/scripts/toggle_floating.sh'';
    tmux_sessionizer = pkgs.writeScriptBin "tmux_sessionizer" ''${pkgs.stdenv.shell} $HOME/dotfiles/features/scripts/tmux/tmux_sessionizer'';
    pick_commit = pkgs.writeScriptBin "pick_commit" ''
        #!${pkgs.bash}/bin/bash
        exec "$HOME/dotfiles/features/scripts/pick_commit.sh" "$@"
    '';
in {
    home.packages = [
        osd_volumen
        osd_brightness
        gpu_replay
        toggle_floating
        tmux_sessionizer
        pick_commit
    ];
}
