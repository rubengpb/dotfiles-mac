#!/usr/bin/env bash
# Fresh Mac (Homebrew already installed): packages, dotfiles, macOS settings. Safe to re-run.
set -euo pipefail
cd "$(dirname "$0")/.."

brew bundle --file=Brewfile

# Real dirs first, so stow links our subfolders instead of the whole ~/.config or ~/.local
mkdir -p ~/.config ~/.local/bin
stow .

./setup/macos.sh
./setup/wallpaper.sh
