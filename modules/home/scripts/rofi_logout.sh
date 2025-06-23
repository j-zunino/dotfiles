#!/usr/bin/env bash

# Description: Logout, shutdown, reboot or lock screen.
# Dependencies: rofi, systemctl, slock, Nerd Font
#
# Credits: https://gitlab.com/dwt1/dmscripts

set -euo pipefail

CONFIRM_OPTIONS=" No\n Yes"

confirm_action() {
    local action=$1
    echo -e "$CONFIRM_OPTIONS" | rofi -dmenu -i -p "$action?"
}

main() {
    declare -a options=(
        " Lock screen"
        "󰒲 Suspend"
        " Logout"
        "⏻ Shutdown"
        " Reboot"
        " Quit"
    )

    declare -A actions=(
        [" Lock screen"]="lock"
        ["󰒲 Suspend"]="suspend"
        [" Logout"]="logout"
        ["⏻ Shutdown"]="shutdown"
        [" Reboot"]="reboot"
        [" Quit"]="quit"
    )

    choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "Choose an action:")

    if [[ -z $choice ]]; then
        exit 0
    fi

    case ${actions["$choice"]} in
        logout)
            if [[ "$(confirm_action "$choice")" == " Yes" ]]; then
                loginctl kill-user "$UID"
            else
                exit 1
            fi
            ;;
        lock)
            hyprlock
            ;;
        reboot)
            if [[ "$(confirm_action "$choice")" == " Yes" ]]; then
                systemctl reboot
            else
                exit 0
            fi
            ;;
        shutdown)
            if [[ "$(confirm_action "$choice")" == " Yes" ]]; then
                systemctl poweroff
            else
                exit 0
            fi
            ;;
        suspend)
            if [[ "$(confirm_action "$choice")" == " Yes" ]]; then
                systemctl suspend
            else
                exit 0
            fi
            ;;
        quit) ;;
        *)
            exit 0
            ;;
    esac
}

[[ ${BASH_SOURCE[0]} == "${0}" ]] && main
