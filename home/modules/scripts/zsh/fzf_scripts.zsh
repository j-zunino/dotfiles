# Fzf: Open file
fzf_file() {
    local file
    file=$(fd --type f | fzf \
        --border-label=" Select a file to open " \
        --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down") || return
    [[ -n $file ]] && nvim "$file"
    zle reset-prompt
}

# Fzf: Live grep
live_grep() {
    local query result file linenumber

    if [[ -z $1 ]]; then
        read -r "query?Enter search pattern: "
    else
        query="$*"
    fi

    result=$(rg --ignore-case --color=always --line-number --no-heading "$query" 2>/dev/null |
        fzf --ansi \
            --delimiter ":" \
            --preview "bat --style=numbers --color=always {1} --highlight-line {2}" \
            --preview-window "+{2}+3/3,~3" \
            --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down")

    file="''${result%%:*}"
    linenumber="$(echo "''${result}" | cut -d: -f2)"
    if [[ -n $file ]]; then
        $EDITOR +"$linenumber" "$file"
    fi
}

zle -N fzf_file
zle -N live_grep

bindkey "^T" fzf_file
bindkey "^G" live_grep
