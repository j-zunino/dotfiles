autoload -Uz vcs_info

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
        [[ $STAGED -gt 0 ]] && hook_com[misc]+=" %F{green}+$STAGED%f"

        UNSTAGED=$(echo "$GIT_STATUS" | grep -E '^ ' | wc -l)
        [[ $UNSTAGED -gt 0 ]] && hook_com[misc]+=" %F{yellow}*$UNSTAGED%f"

        UNTRACKED=$(echo "$GIT_STATUS" | grep '^??' | wc -l)
        [[ $UNTRACKED -gt 0 ]] && hook_com[misc]+=" %F{red}??$UNTRACKED%f"
    fi
}

setopt PROMPT_SUBST
export PS1='%B%F{red}󰉋 %~%f $(print -P "$vcs_info_msg_0_")
%B%F{green}>%f%b '

# zle-keymap-select() {
#     if [[ $KEYMAP == vicmd ]]; then
#         echo -ne "\e[2 q"
#     else
#         echo -ne "\e[5 q"
#     fi
# }
# precmd_functions+=(zle-keymap-select)
# zle -N zle-keymap-select

precmd() {
    psvar=()
    vcs_info
    [[ -n $vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_"
    # zle-keymap-select
}
