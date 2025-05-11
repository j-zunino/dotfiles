{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;

    initExtra = ''
      autoload -Uz vcs_info

      KEYTIMEOUT=1
      bindkey -v

      # Prompt
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:*' formats '%F{yellow} %b%f%m'
      zstyle ':vcs_info:*' actionformats '%F{yellow} %b%f %F{blue}%a%f'
      zstyle ':vcs_info:git*+set-message:*' hooks git-check

      +vi-git-check() {
        if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]]; then
          local GIT_STATUS UNPUSHED UNPULLED STAGED UNSTAGED UNTRACKED

          UNPUSHED=$(git log --oneline @{u}.. 2>/dev/null | wc -l)
          [[ $UNPUSHED -gt 0 ]] && hook_com[misc]+=" %F{blue}↑$UNPUSHED%f"

          UNPULLED=$(git log --oneline ..@{u} 2>/dev/null | wc -l)
          [[ $UNPULLED -gt 0 ]] && hook_com[misc]+=" %F{magenta}↓$UNPULLED%f"

          GIT_STATUS=$(git status --porcelain)

          STAGED=$(echo "$GIT_STATUS" | grep -v '??' | grep -E '^[^ ]' | wc -l)
          [[ $STAGED   -gt 0 ]] && hook_com[misc]+=" %F{green}+$STAGED%f"

          UNSTAGED=$(echo "$GIT_STATUS" | grep -E '^ ' | wc -l)
          [[ $UNSTAGED -gt 0 ]] && hook_com[misc]+=" %F{yellow}*$UNSTAGED%f"

          UNTRACKED=$(echo "$GIT_STATUS" | grep '^??' | wc -l)
          [[ $UNTRACKED -gt 0 ]] && hook_com[misc]+=" %F{red}??$UNTRACKED%f"
        fi
      }

      setopt PROMPT_SUBST
      export PS1='%B%F{red}󰉋 %~%f $(print -P "$vcs_info_msg_0_")
      %B%F{green} %f%b '


      # Vim cursor
      zle-keymap-select () {
          if [[ $KEYMAP == vicmd ]]; then
              echo -ne "\e[2 q"
          else
              echo -ne "\e[5 q"
          fi
      }
      precmd_functions+=(zle-keymap-select)
      zle -N zle-keymap-select


      precmd() {
        psvar=()
        vcs_info
        [[ -n $vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"
        zle-keymap-select  # mantener el cursor estilo vim
      }


      # Source .env
      if [ -f "$HOME/dotfiles/.env" ]; then
        set -a
        source "$HOME/dotfiles/.env"
        set +a
      fi

      # Zoxide
      eval "$(zoxide init zsh)"


      # Fzf
      fzf_file() {
        local file
        file=$(fd --type f | fzf \
          --border-label=" Select a file to open " \
          --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down") || return
        [[ -n "$file" ]] && nvim "$file"
        zle reset-prompt
      }

      fzf_zoxide() {
        local dir
        dir=$(zoxide query -l | fzf \
          --no-preview \
          --border-label=' Select a folder to cd into ') || return
        [[ -n "$dir" ]] && z "$dir"

        precmd
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
      zle -N fzf_zoxide
      zle -N live_grep

      bindkey "^F" fzf_file
      bindkey "^Z" fzf_zoxide
      bindkey "^G" live_grep
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
