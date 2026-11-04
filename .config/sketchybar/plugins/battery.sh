#!/usr/bin/env bash
info=$(pmset -g batt)
pct=$(grep -Eo '[0-9]+%' <<<"$info" | tr -d %)
[[ -z $pct ]] && exit 0
if grep -q 'AC Power' <<<"$info"; then icon=󰂄
elif (( pct > 80 )); then icon=󰁹
elif (( pct > 50 )); then icon=󰂀
elif (( pct > 20 )); then icon=󰁼
else icon=󰁺
fi
sketchybar --set "$NAME" icon="$icon" label="$pct%"
