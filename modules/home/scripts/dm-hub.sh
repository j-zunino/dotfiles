#!${pkgs.stdenv.shell}
#
# Description: A hub allowing you to execute all the other dmscripts.
# Dependencies: dmenu, fzf
#
# Credits: https://gitlab.com/dwt1/dmscripts

set -euo pipefail

# Set the path to the current script directory
_path=$(dirname "$(realpath "$0")")

# Function to display and execute scripts using dmenu
function maindmenu() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    # Find all .sh scripts starting with "dm-" in the current script directory
    while IFS= read -r -d '' script; do
        # Extract the description from each script
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -name "dm-*.sh" -print0)

    # Display the list of scripts using dmenu
    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | dmenu -l 10 -p 'Run Script:' "$@")

    # Execute the selected script
    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -d "$@"
    else
        echo "Program terminated." && exit 0
    fi
}

# Function to display and execute scripts using fzf
function mainfzf() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    # Find all .sh scripts starting with "dm-" in the current script directory
    while IFS= read -r -d '' script; do
        # Extract the description from each script
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -name "dm-*.sh" -print0)

    # Display the list of scripts using fzf
    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | fzf --prompt='Run Script: ')

    # Execute the selected script
    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -f
    else
        echo "Program terminated." && exit 0
    fi
}

# Function to display and execute scripts using rofi
function mainrofi() {
    local _self
    declare -A _scripts

    _self=$(basename "$0")

    # Find all .sh scripts starting with "dm-" in the current script directory
    while IFS= read -r -d '' script; do
        # Extract the description from each script
        script_name=$(echo "$(basename "${script}") $(grep '^# Description: ' "${script}")" | sed 's/# Description: /- /g')
        [[ "${script_name}" == "${_self}" ]] && continue
        _scripts[${script_name}]="${script}"
    done < <(find "${_path}" -type f -name "dm-*.sh" -print0)

    # Display the list of scripts using rofi
    choice=$(printf '%s\n' "${!_scripts[@]}" | sort | grep ".*dm.*" | rofi -dmenu -p 'Run Script:' "$@")

    # Execute the selected script
    if [ "${choice}" ]; then
        thecommand="$(printf '%s' "${_scripts["${choice}"]}" | awk '{print $1}')"
        bash "$thecommand" -r "$@"
    else
        echo "Program terminated." && exit 0
    fi
}

# Parse command-line options for dmenu, fzf, or rofi
no_opt=1
while getopts "dfrh" arg 2>/dev/null; do
    case "${arg}" in
    d) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && maindmenu ;;
    f) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && mainfzf ;;
    r) [[ "${BASH_SOURCE[0]}" == "${0}" ]] && mainrofi "$@" ;;
    h) echo "Usage: $(basename "$0") [-d (dmenu)] [-f (fzf)] [-r (rofi)] [-h (help)]"; exit 0 ;;
    *) echo "Error: invalid option" "Type $(basename "$0") -h for help"; exit 1 ;;
    esac
    no_opt=0
done

# Default to dmenu if no option is passed
[ $no_opt = 1 ] && [[ "${BASH_SOURCE[0]}" == "${0}" ]] && maindmenu "$@"
#!${pkgs.stdenv.shell}
