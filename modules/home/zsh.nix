{ config, pkgs, ... }:

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

            export PS1='%B%F{green}[%n%F{cyan}@%F{blue}%m] %F{blue}  %F{red} %~ %B%F{yellow}$(__git_ps1 " %s")%f%b 
            %F{green}$%b%f '
        '';

        shellAliases = {
            ll = "ls -l";
            ff = "fastfetch";
            c = "clear";
            n = "nvim";
            v = "vim";
            y = "yazi";
            f = "yazi";
        };

        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };

    };
}

