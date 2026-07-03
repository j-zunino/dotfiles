{...}: {
    flake.modules.nixos.zsh = {
        programs.zsh.enable = true;
    };

    flake.modules.homeManager.zsh = {pkgs, ...}: {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            history.size = 10000;

            initContent = ''
                KEYTIMEOUT=1
                bindkey -v

                bindkey '^J' history-search-backward
                bindkey '^K' history-search-forward
                bindkey '^L' autosuggest-accept
                bindkey '^[[D' backward-char
                bindkey '^[[C' forward-char
                bindkey '^[[1;5C' forward-word
                bindkey '^[[1;5D' backward-word
                bindkey -s '^f' '$HOME/dotfiles/scripts/tmux/sessionizer^M'
                bindkey -s '^e' 'nvim +Oil^M'

                setopt auto_param_slash
                zstyle ':fzf-tab:*' use-fzf-default-opts yes
                zstyle ':fzf-tab:*' fzf-flags --margin 0 --bind=tab:accept
                stty stop undef
            '';

            plugins = [
                {
                    name = "fzf-tab";
                    src = pkgs.zsh-fzf-tab;
                    file = "share/fzf-tab/fzf-tab.plugin.zsh";
                }
            ];

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

                # Nix
                dotfiles = "$HOME/dotfiles/scripts/dotfiles";

                # Git
                gaa = "git add --all";

                # Dev
                dev = "pnpm run dev";
                build = "pnpm run build";
                shadcn = "pnpm dlx shadcn@latest";
            };
        };
    };
}
