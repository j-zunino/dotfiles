#!/usr/bin/env bash

TERM="$1"
CLASS="$2"
APP="$3"

if hyprctl clients | grep -q "class: $CLASS"; then
    hyprctl dispatch closewindow "class:$CLASS"
    exit 0
fi

case "$TERM" in
    wezterm)
        exec wezterm start --class "$CLASS" "$APP"
        ;;
    foot)
        exec foot --app-id="$CLASS" "$APP"
        ;;
    *)
        echo "Unknown terminal: $TERM" >&2
        exit 1
        ;;
esac
