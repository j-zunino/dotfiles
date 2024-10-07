#!${pkgs.stdenv.shell}
#
# Description: Logout, shutdown, reboot or lock screen.
# Dependencies: dmenu, systemctl, slock, notify-send, Nerd Font
#
# Credits: https://gitlab.com/dwt1/dmscripts

set -euo pipefail

# Function to display messages
output() {
    if [[ ${TERM} == 'dumb' ]]; then
        notify-send "dm-logout" "$@"
    else
        echo "$@"
    fi
}

main() {
    # An array of options to choose.
    declare -a options=(
        " Lock screen"
        "󰒲 Suspend"
        " Logout"
        "⏻ Shutdown"
        " Reboot"
        " Quit"
    )

    # Look up what window managers are used.
    declare -a managers
    while IFS= read -r manager; do
        managers+=("${manager,,}")
    done < <(grep -E 'Name=' /usr/share/xsessions/*.desktop | cut -d'=' -f2)
    managers+=("xmonad-x86_64-linux")

    # Piping the above array into dmenu.
    choice=$(printf '%s\n' "${options[@]}" | dmenu -p "Choose an action:")

    # Handle the user's choice.
    case $choice in
    ' Logout')
        if [[ "$(echo -e " No\n Yes" | dmenu -p "${choice}?")" == " Yes" ]]; then
            for manager in "${managers[@]}"; do
                loginctl kill-user "$UID"
            done
        else
            output "User chose not to logout." && exit 1
        fi
        ;;
    ' Lock screen')
        # Assuming slock is installed for locking the screen
        slock
        ;;
    ' Reboot')
        if [[ "$(echo -e " No\n Yes" | dmenu -p "${choice}?")" == " Yes" ]]; then
            systemctl reboot
        else
            output "User chose not to reboot." && exit 0
        fi
        ;;
    '⏻ Shutdown')
        if [[ "$(echo -e " No\n Yes" | dmenu -p "${choice}?")" == " Yes" ]]; then
            systemctl poweroff
        else
            output "User chose not to shutdown." && exit 0
        fi
        ;;
    '󰒲 Suspend')
        if [[ "$(echo -e " No\n Yes" | dmenu -p "${choice}?")" == " Yes" ]]; then
            systemctl suspend
        else
            output "User chose not to suspend." && exit 0
        fi
        ;;
    ' Quit')
        output "Program terminated." && exit 0
        ;;
    *)
        exit 0
        ;;
    esac
}

# Ensure this script is executed only when directly run, not sourced
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main
