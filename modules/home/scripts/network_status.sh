#!/usr/bin/env bash

status="$(iwctl station wlan0 show | awk '/State/ {print $2}')"
icon="󰤮"

if [[ "$status" == "connected" ]]; then
    rssi="$(iwctl station wlan0 show | awk '/RSSI/ {print $2; exit}')"

    if [[ "$rssi" =~ ^-?[0-9]+$ ]]; then
        min=-100
        max=-30
        strength=$(( (rssi - min) * 100 / (max - min) ))

        if (( strength <= 0 )); then icon="󰤯"
        elif (( strength <= 25 )); then icon="󰤟"
        elif (( strength <= 50 )); then icon="󰤢"
        elif (( strength <= 75 )); then icon="󰤥"
        else icon="󰤨"
        fi
    else
        icon="󰈀"
    fi
fi

echo "$icon ­" # NOTE: invisible char

