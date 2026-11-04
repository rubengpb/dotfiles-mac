#!/usr/bin/env bash
# $1 = workspace of this item; FOCUSED_WORKSPACE comes with the AeroSpace trigger
export PATH=/opt/homebrew/bin:$PATH
source "$CONFIG_DIR/colors.sh"
focused=${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}
if [[ $1 == "$focused" ]]; then
  sketchybar --set "$NAME" background.drawing=on label.color=$TEXT
else
  sketchybar --set "$NAME" background.drawing=off label.color=$MUTED
fi
