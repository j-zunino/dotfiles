#!/usr/bin/env bash

status="$(cat /sys/class/power_supply/BAT0/status)"
level="$(cat /sys/class/power_supply/BAT0/capacity)"

icon=""
if [[ "$status" == "Charging" ]]; then
    icon=""
else
    if (( level == 0 )); then icon=""
    elif (( level <= 25 )); then icon=""
    elif (( level <= 50 )); then icon=""
    elif (( level <= 75 )); then icon=""
    else icon=""
    fi
fi

printf "%s %s%%" "$icon" "$level"

