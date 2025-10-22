#!/usr/bin/env bash

REPLAY_DIR="$HOME/Videos/Replays"

GSR_CMD="gpu-screen-recorder -w DP-1 -f 60 -a default_output -a default_input -c mkv -r 120 -bm cbr -q 15000 -replay-storage ram -df yes -restart-replay-on-save yes -o \"$REPLAY_DIR\""

ACTION="$1" # "toggle" or "save"

PID=$(pgrep -f "gpu-screen-recorder.*-w DP-1" | grep -v $$)

if [[ -z $ACTION ]]; then
    if [[ -n $PID ]]; then
        echo '{"text":"󰑊","tooltip":"GPU Screen Recorder is running","class":"recording"}'
    else
        echo '{"text":"","tooltip":"GPU Screen Recorder is not running","class":"idle"}'
    fi
    exit 0
fi

if [[ $ACTION == "toggle" ]]; then
    if [[ -n $PID ]]; then
        kill -SIGINT $PID
        notify-send "Replay stopped"
    else
        eval "$GSR_CMD" &
        disown
        notify-send "Replay started"
    fi
elif [[ $ACTION == "save" ]]; then
    if [[ -n $PID ]]; then
        kill -SIGUSR1 $PID
        notify-send "Replay saved"
    else
        notify-send "Replay not running"
    fi
else
    echo "Usage: $0 toggle|save|empty"
    exit 1
fi
