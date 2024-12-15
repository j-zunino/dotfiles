#!/usr/bin/env bash

BAR_LENGTH=20
NOTIFY_ID=1001
NOTIFY_TIMEOUT=1000

ICON_MUTED="󰖁"

ICON_VOL_LOW="󰕿"
ICON_VOL_MEDIUM="󰖀"
ICON_VOL_HIGH="󰕾"

ICON_BRIGHTNESS=( "󱩎" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" )

generate_progress_bar() {
    local level=$1
    local filled_length=$((level * BAR_LENGTH / 100))
    local empty_length=$((BAR_LENGTH - filled_length))

    printf '%s' "$(printf '█%.0s' $(seq 1 $filled_length))"
    printf '%s' "$(printf ' %.0s' $(seq 1 $empty_length))"
}

get_volume_icon() {
    local level=$1

    if [ "$level" -eq 0 ]; then
        echo "$ICON_MUTED"
    elif [ "$level" -le 25 ]; then
        echo "$ICON_VOL_LOW"
    elif [ "$level" -le 75 ]; then
        echo "$ICON_VOL_MEDIUM"
    else
        echo "$ICON_VOL_HIGH"
    fi
}

get_brightness_icon() {
    local level=$1
    local index=$((level / 10))

    echo "${ICON_BRIGHTNESS[$index]}"
}

volume() {
    local volume_output

    volume_output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null) || {
        notify-send -r $NOTIFY_ID "Error: Failed to get volume"
        return 1
    }

    local volume_level=$(awk '{print int($2 * 100)}' <<< "$volume_output")
    local icon=$(get_volume_icon "$volume_level")
    local progress_bar=$(generate_progress_bar "$volume_level")

    notify-send -t $NOTIFY_TIMEOUT -r $NOTIFY_ID "${icon} ${progress_bar} ${volume_level}%"
}

toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    local volume_output

    volume_output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null) || {
        notify-send -r $NOTIFY_ID "Error: Failed to get volume"
        return 1
    }

    local volume_level=$(awk '{print int($2 * 100)}' <<< "$volume_output")
    local icon=$(get_volume_icon "$volume_level")
    local progress_bar=$(generate_progress_bar "$volume_level")

    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '[MUTED]'; then
        notify-send -t $NOTIFY_TIMEOUT -r $NOTIFY_ID "$ICON_MUTED ${progress_bar} ${volume_level}%"
    else
        notify-send -t $NOTIFY_TIMEOUT -r $NOTIFY_ID "${icon} ${progress_bar} ${volume_level}%"
    fi
}

brightness() {
    local brightness_output
    brightness_output=$(brightnessctl g 2>/dev/null) || {
        notify-send -r $NOTIFY_ID "Error: Failed to get brightness"
        return 1
    }

    local max_brightness
    max_brightness=$(brightnessctl m)

    local brightness_level=$((brightness_output * 100 / max_brightness))
    local icon=$(get_brightness_icon "$brightness_level")
    local progress_bar=$(generate_progress_bar "$brightness_level")

    notify-send -t $NOTIFY_TIMEOUT -r $NOTIFY_ID "${icon} ${progress_bar} ${brightness_level}%"
}

main() {
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
    esac
}

main "$@"

