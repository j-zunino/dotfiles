{config, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;

        initContent = ''
            KEYTIMEOUT=1
            bindkey -v

            eval "$(zoxide init zsh)"

            source $HOME/dotfiles/home/modules/scripts/zsh/promp.zsh
            source $HOME/dotfiles/home/modules/scripts/zsh/fzf_scripts.zsh

            bindkey '^J' history-search-backward
            bindkey '^K' history-search-forward
            bindkey '^L' autosuggest-accept

            bindkey -s '^f' '$HOME/dotfiles/home/modules/scripts/tmux/tmux_sessionizer^M'
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
            ff = "fastfetch";
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
}
