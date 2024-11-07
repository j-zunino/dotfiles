{ config, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;

        initExtra = ''
            source ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
            setopt PROMPT_SUBST

            bindkey -v

            KEYTIMEOUT=1

            zle-keymap-select () {
                if [[ $KEYMAP == vicmd ]]; then
                    echo -ne '\e[2 q'
                else
                    echo -ne '\e[5 q'
                fi
            }

            precmd_functions+=(zle-keymap-select)
            zle -N zle-keymap-select

            # export PS1='%B%F{green}[%n%F{cyan}@%F{blue}%m] %F{blue}  %F{red} %~ %B%F{yellow}$(__git_ps1 " %s")%f%b 
            # %F{green}$%b%f '

            export PS1='%B%F{red} %~ %B%F{yellow}$(__git_ps1 " %s")%f%b 
            %F{green} %b%f '
        '';

        shellAliases = {
            ll = "ls -l";
            ff = "fastfetch";
            c = "clear";
            n = "nvim";
            v = "vim";
            y = "yazi";
            f = "yazi";
            gs = "git status";
            ga = "git add";
            gaa = "git add --all";
            gc = "git commit";
            gp = "git push";
            gd = "git diff";
            gds = "git diff --staged";
            gf = "git fetch";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };
}

