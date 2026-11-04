#!/usr/bin/env bash
# Toro wallpaper: light/dark version follows the system appearance. Safe to re-run.
set -euo pipefail
cd "$(dirname "$0")/.."

out="$HOME/Pictures/toro.heic"
swift setup/dynamic-wallpaper.swift wallpapers/toro-light.png wallpapers/toro-dark.png "$out"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to POSIX file \"$out\""
