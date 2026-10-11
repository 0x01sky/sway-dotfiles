#!/usr/bin/env bash
pkill -x waybar

while pgrep -x waybar >/dev/null; do
    sleep 0.2
done

exec waybar \
    -c "$HOME/.config/waybar/config.jsonc" \
    -s "$HOME/.config/waybar/style.css"

