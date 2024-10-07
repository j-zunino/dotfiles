#!${pkgs.stdenv.shell}
#
# Description: Connect to WiFi using dmenu
# Dependencies: dmenu, nmcli, Nerd Font
#
# Credits: https://gitlab.com/dwt1/dmscripts


set -euo pipefail

main() {
    # Get the list of WiFi networks (SSID, SECURITY, RATE, BARS, SIGNAL)
    wifi_list=$(nmcli -f SSID,SECURITY,RATE,BARS,SIGNAL device wifi list | tail -n +2)

    # Use dmenu to select a WiFi network
    selected_line=$(echo "$wifi_list" | dmenu -l 10 -p "Select Wifi  :")
    selected_ssid=$(echo "$selected_line" | awk -F'  ' '{print $1}' | xargs)

    # Ask for the WiFi password using dmenu
    pass=$(printf '%s' "" | dmenu -p "Enter Password 󰟵 :")

    # Connect to the selected WiFi network
    if [ -n "$pass" ]; then
        nmcli device wifi connect "$selected_ssid" password "$pass"
    else
        nmcli device wifi connect "$selected_ssid"
    fi

    # Check if the internet is working by pinging Google
    if ping -q -c 2 -W 2 google.com >/dev/null; then
        echo "Your internet is working :)"
    else
        echo "Your internet is not working :("
    fi
}

# Ensure this script is executed only when directly run, not sourced
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main

