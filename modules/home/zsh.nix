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

            # Zoxide
            eval "$(zoxide init zsh)"

            source $HOME/dotfiles/modules/home/scripts/promp.zsh
            source $HOME/dotfiles/modules/home/scripts/fzf_scripts.zsh
            source $HOME/dotfiles/modules/home/scripts/zellij_tabs.zsh

            bindkey '^J' history-search-backward
            bindkey '^K' history-search-forward
            bindkey '^L' autosuggest-accept
        '';

        envExtra = ''
            if [ -f "$HOME/dotfiles/.env" ]; then
              set -a
              source "$HOME/dotfiles/.env"
              set +a
            fi
        '';

        shellAliases = {
            ls = "eza --group-directories-first --icons=always --color=always";
            la = "eza -a --group-directories-first --icons=always --color=always";
            ll = "eza -l --icons=always --color=always";
            tree = "eza -T --icons=always --color=always";
            ff = "fastfetch";
            c = "clear";
            n = "nvim";
            v = "vim";
            y = "yazi";
            f = "yazi";

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
