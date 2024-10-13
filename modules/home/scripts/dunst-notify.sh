#!/usr/bin/env bash

# Volume function to display current volume level with a progress bar
volume() {
    local volume_level
    volume_level=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

    local icon
    if [ "$volume_level" -eq 0 ]; then
        icon="󰝟 "
    elif [ "$volume_level" -le 25 ]; then
        icon="󰕿 "
    elif [ "$volume_level" -le 75 ]; then
        icon="󰖀 "
    else
        icon="󰕾 "
    fi

    local bar_length=20
    local filled_length=$((volume_level * bar_length / 100))
    local empty_length=$((bar_length - filled_length))

    local filled_bar=""
    if [ "$filled_length" -gt 0 ]; then
        filled_bar=$(printf '█%.0s' $(seq 1 $filled_length))
    fi
    local empty_bar=$(printf ' %.0s' $(seq 1 $empty_length))

    local progress_bar="${filled_bar}${empty_bar}"

    notify-send -r 1001 "${icon}${progress_bar}${volume_level}%"
}

# Toggle mute function
toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '[MUTED]'; then
        notify-send -r 1001 "󰝟 Muted"
    else
        volume
    fi
}

# Brightness function to display current brightness level with a progress bar
brightness() {
    local brightness_level
    brightness_level=$(brightnessctl g | awk -v max=$(brightnessctl m) '{print int(($1 / max) * 100)}')

    local icon
    if [ "$brightness_level" -eq 0 ]; then
        icon="󱩎 "
    elif [ "$brightness_level" -le 10 ]; then
        icon="󱩎 "
    elif [ "$brightness_level" -le 20 ]; then
        icon="󱩏 "
    elif [ "$brightness_level" -le 30 ]; then
        icon="󱩐 "
    elif [ "$brightness_level" -le 40 ]; then
        icon="󱩑 "
    elif [ "$brightness_level" -le 50 ]; then
        icon="󱩒 "
    elif [ "$brightness_level" -le 60 ]; then
        icon="󱩓 "
    elif [ "$brightness_level" -le 70 ]; then
        icon="󱩔 "
    elif [ "$brightness_level" -le 80 ]; then
        icon="󱩕 "
    elif [ "$brightness_level" -le 90 ]; then
        icon="󱩖 "
    else
        icon="󰛨 "
    fi

    local bar_length=20
    local filled_length=$((brightness_level * bar_length / 100))
    local empty_length=$((bar_length - filled_length))

    local filled_bar=""
    if [ "$filled_length" -gt 0 ]; then
        filled_bar=$(printf '█%.0s' $(seq 1 $filled_length))
    fi
    local empty_bar=$(printf ' %.0s' $(seq 1 $empty_length))

    local progress_bar="${filled_bar}${empty_bar}"

    notify-send -r 1001 "${icon} ${progress_bar}${brightness_level}%"
}

# Parse arguments
case "$1" in
    volume)
        volume
        ;;
    mute)
        toggle_mute
        ;;
    brightness)
        brightness
        ;;
    *)
        echo "Invalid argument"
        ;;
esac

