#!/usr/bin/env bash

selection=$(printf " Clear clipboard\n%s" "$(cliphist list)" | rofi -dmenu -i -p "󰅍 Clipboard")

case "$selection" in
  " Clear clipboard")
    cliphist wipe
    wl-copy ""
    notify-send "󰅍  Clipboard" "Clipboard history cleared"
    ;;
  "")
    ;;
  *)
    cliphist decode <<< "$selection" | wl-copy
    ;;
esac
