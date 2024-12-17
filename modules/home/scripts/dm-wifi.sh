#!/bin/bash
#
# Description: Connect to WiFi using rofi
# Dependencies: rofi, nmcli, Nerd Font
#
# Credits:
# https://gitlab.com/dwt1/dmscripts
# https://github.com/ericmurphyxyz/rofi-wifi-menu

set -euo pipefail

notify-send "󰚭 Getting list of available Wi-Fi networks..."

main() {
    wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

    connected=$(nmcli -fields WIFI g)
    if [[ "$connected" =~ "enabled" ]]; then
        toggle="󰤮  Disable Wi-Fi"
    elif [[ "$connected" =~ "disabled" ]]; then
        toggle="󰤨  Enable Wi-Fi"
    fi

    chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )
    read -r chosen_id <<< "${chosen_network:3}"

    if [ -z "$chosen_network" ]; then
        exit
    elif [ "$chosen_network" = "󰤨 Enable Wi-Fi" ]; then
        nmcli radio wifi on
        notify-send "󰤨 Wi-Fi Enabled" "Wi-Fi has been turned on."
        exit 0
    elif [ "$chosen_network" = "󰤮 Disable Wi-Fi" ]; then
        nmcli radio wifi off
        notify-send "󰤮 Wi-Fi Disabled" "Wi-Fi has been turned off."
        exit 0
    else
        success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
        saved_connections=$(nmcli -g NAME connection)
        if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
            nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "󰤨 Connection Established" "$success_message"
        else
            if [[ "$chosen_network" =~ "" ]]; then
                wifi_password=$(rofi -dmenu -p "Password: " || true)
                wifi_password=${wifi_password:-""}
            fi
            if [[ -n "$wifi_password" ]]; then
                nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "󰤨 Connection Established" "$success_message"
            else
                notify-send " Connection Failed" "Password was not provided for \"$chosen_id\"."
                exit 1
            fi
        fi
    fi
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main

