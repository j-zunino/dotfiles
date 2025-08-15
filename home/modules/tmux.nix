{pkgs, ...}: let
    tmux-tilix = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tilix";
        name = "tmux-tilix";
        src = pkgs.fetchFromGitHub {
            owner = "j-zunino";
            repo = "tmux-tilix";
            rev = "dd3facbcc9eb042f3d6e3699b0489eab43629b04";
            hash = "sha256-1ukpXKjm2zDBE2zOHrPPNWUYiK931N8WjTdKsZUG63Q=";
        };
    };
in {
    programs.tmux = {
        enable = true;

        prefix = "C-a";
        mouse = true;
        baseIndex = 1;
        resizeAmount = 10;
        disableConfirmationPrompt = true;

        extraConfig = ''
            set-option -sa terminal-features ",xterm*:RGB"
            set -g renumber-windows on

            bind-key -n C-f new-window -n sessionizer "$HOME/dotfiles/home/modules/scripts/tmux/tmux_sessionizer"

            # Pane
            set-option -g pane-active-border-style "fg=colour2,bg=default"

            # Status bar
            set -g status-position top
            set -g status-justify absolute-centre

            set -g window-status-style "fg=colour8,nobold bg=default"
            set -g window-status-current-style "fg=colour2,bold bg=default"
            set -g window-status-current-format "#I:#W "

            set -g status-style "fg=colour8,nobold bg=default"
            set -g status-left ""
            set -g status-right "#S"
        '';

        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.resurrect
            {
                plugin = tmuxPlugins.yank;
                extraConfig = ''
                    set-window-option -g mode-keys vi
                    bind-key -T copy-mode-vi v send-keys -X begin-selection
                    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
                    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
                    bind-key -T copy-mode-vi Escape send-keys -X cancel
                '';
            }
            {
                plugin = tmux-tilix;
                extraConfig = ''
                    set -g @tilix-shiftnum '=!"#$%&/()'
                '';
            }
        ];
    };
}
