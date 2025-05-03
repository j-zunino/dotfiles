{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;

    initExtra = ''
      source $HOME/.nix-profile/share/git/contrib/completion/git-prompt.sh
      setopt PROMPT_SUBST

      bindkey -v

      KEYTIMEOUT=1

      zle-keymap-select () {
          if [[ $KEYMAP == vicmd ]]; then
              echo -ne "\e[2 q"
          else
              echo -ne "\e[5 q"
          fi
      }

      # Prompt
      precmd_functions+=(zle-keymap-select)
      zle -N zle-keymap-select

      # export PS1="%B%F{green}[%n%F{cyan}@%F{blue}%m] %F{blue}  %F{red} %~ %B%F{yellow}$(__git_ps1 " %s")%f%b
      # %F{green}$%b%f "

      export PS1="%B%F{red}󰉋 %~ %B%F{yellow}$(__git_ps1 " %s")%f%b
      %F{green} %b%f "

      if [ -f "$HOME/dotfiles/.env" ]; then
          export $(grep -v "^#" $HOME/dotfiles/.env | xargs)
      fi

      # Fzf
      fzf_file() {
        local file
        file=$(fd --type f | fzf \
          --border-label=" Select a file to open " \
          --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down") || return
        [[ -n "$file" ]] && nvim "$file"
        zle reset-prompt
      }

      fzf_zoxide_cd() {
        local dir
        dir=$(zoxide query -l | fzf \
          --no-preview \
          --border-label=' Select a folder to cd into ') || return
        [[ -n "$dir" ]] && z "$dir"
        zle reset-prompt
      }

      live_grep() {
        local query result file linenumber

        if [[ -z "$1" ]]; then
          read -r "query?Enter search pattern: "
        else
          query="$*"
        fi

        result=$(rg --ignore-case --color=always --line-number --no-heading "$query" 2>/dev/null |
          fzf --ansi \
              --delimiter ":" \
              --preview "bat --style=numbers --color=always {1} --highlight-line {2}" \
              --preview-window "+{2}+3/3,~3" \
              --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down" )

        file="''${result%%:*}"
        linenumber="$(echo "''${result}" | cut -d: -f2)"
        if [[ -n "$file" ]]; then
          $EDITOR +"$linenumber" "$file"
        fi
      }

      zle -N fzf_file
      zle -N fzf_zoxide_cd
      zle -N live_grep

      bindkey "^F" fzf_file
      bindkey "^Z" fzf_zoxide_cd
      bindkey "^G" live_grep

      # Zoxide
      eval "$(zoxide init zsh)"
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
      lg = "lazygit";

      hms = "home-manager switch --flake $HOME/dotfiles/.";
      nrs = "sudo nixos-rebuild switch --flake $HOME/dotfiles/.";

      dev = "pnpm run dev";
      build = "pnpm run build";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
