#!/usr/bin/env bash

CLASS="$1"
APP="$2"

if hyprctl clients | grep -q "class: $CLASS"; then
    hyprctl dispatch closewindow "class:$CLASS"
else
    exec wezterm start --class "$CLASS" "$APP"
fi
