#!/usr/bin/env bash
# Fresh Mac (Homebrew already installed): packages, dotfiles, macOS settings. Safe to re-run.
set -euo pipefail
cd "$(dirname "$0")/.."

brew bundle --file=Brewfile

# Real dirs first, so stow links our subfolders instead of the whole ~/.config, ~/.local or ~/.claude
mkdir -p ~/.config ~/.local/bin ~/.claude
stow .
./setup/claude-tui.sh

./setup/macos.sh
./setup/wallpaper.sh
