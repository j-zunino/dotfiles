{
    lib,
    pkgs,
    config,
    ...
}: {
    config = lib.mkIf config.features.cli.zsh {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

            initContent = ''
                KEYTIMEOUT=1
                bindkey -v

                # source $HOME/dotfiles/features/scripts/zsh/promp.zsh
                source $HOME/dotfiles/features/scripts/zsh/fzf_scripts.zsh
                source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

                setopt auto_param_slash
                zstyle ':fzf-tab:*' use-fzf-default-opts yes
                zstyle ':fzf-tab:*' fzf-flags --margin 0 --bind=tab:accept
                stty stop undef

                bindkey '^J' history-search-backward
                bindkey '^K' history-search-forward
                bindkey '^L' autosuggest-accept

                bindkey '^[[D' backward-char
                bindkey '^[[C' forward-char

                bindkey -s '^f' '$HOME/dotfiles/features/scripts/tmux/tmux_sessionizer^M'
                bindkey -s '^e' 'nvim +Oil^M'
            '';

            envExtra = ''
                if [ -f "$HOME/dotfiles/.env" ]; then
                  set -a
                  source "$HOME/dotfiles/.env"
                  set +a
                fi
            '';

            shellAliases = {
                la = "ls -a";
                ll = "ls -l";
                ff = "nerdfetch";
                c = "clear";
                n = "nvim";
                v = "vim";
                f = "nvim +Oil";

                # Git
                lg = "lazygit";
                gs = "git status --short";
                ga = "git add";
                gaa = "git add --all";
                gc = "git commit";
                gp = "git push";
                gu = "git pull";
                gf = "git fetch";
                gd = "git diff";
                gds = "git diff --staged";

                # Nix
                hms = "home-manager switch --flake $HOME/dotfiles/.";
                nrs = "sudo nixos-rebuild switch --flake $HOME/dotfiles/.";

                # Dev
                dev = "pnpm run dev";
                build = "pnpm run build";
            };

            history = {
                size = 10000;
                path = "${config.xdg.dataHome}/zsh/history";
            };
        };
    };
}
