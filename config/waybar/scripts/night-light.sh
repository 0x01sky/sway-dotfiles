#!/usr/bin/env bash

STATE="$HOME/.cache/waybar-night-light"
mkdir -p "$HOME/.cache"

if [[ "$1" == "toggle" ]]; then
    if [[ -f "$STATE" ]]; then
        pkill -x gammastep
        rm -f "$STATE"
    else
        gammastep -m wayland -O 3500 >/tmp/gammastep.log 2>&1 &
        sleep 0.5

        if pgrep -x gammastep >/dev/null; then
            touch "$STATE"
        fi
    fi
fi

if [[ -f "$STATE" ]]; then
    printf '{"text":" ","tooltip":"Night Light ON","class":"enabled"}\n'
else
    printf '{"text":"󱓤 ","tooltip":"Night Light OFF","class":"disabled"}\n'
fi
