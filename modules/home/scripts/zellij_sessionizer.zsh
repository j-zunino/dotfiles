zellij_sessionizer() {
    (
        search_paths=(
            "$HOME/dotfiles:0"
            "$HOME/workspace:1"
        )

        all_dirs=()

        for entry in "${search_paths[@]}"; do
            IFS=":" read -r dir depth <<<"$entry"
            if [[ -d $dir ]]; then
                if [[ $depth == "0" ]]; then
                    all_dirs+=("$dir")
                else
                    matches=$(fd . "$dir" --min-depth "$depth" --max-depth "$depth" --type d 2>/dev/null)
                    all_dirs+=($matches)
                fi
            fi
        done

        selected_path=$(printf '%s\n' "${all_dirs[@]}" | fzf --preview='')

        if [[ -z $selected_path ]]; then
            exit
        fi

        session_name=$(basename "$selected_path" | tr . _)

        if [[ -z $ZELLIJ ]]; then
            cd "$selected_path"
            exec zellij attach "$session_name" -c
        else
            zellij action new-pane
            zellij action write-chars "cd \"$selected_path\"" && zellij action write 10
        fi
    ) </dev/tty >/dev/tty 2>&1
}

zle -N zellij_sessionizer
bindkey "^Z" zellij_sessionizer
