#!/usr/bin/env bash
# macOS settings for a keyboard-driven, tiling setup. Safe to re-run.
set -euo pipefail

# Keyboard: fast repeat, and hold-to-repeat instead of the accent menu (hjkl in vim)
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Cmd+Ctrl + drag moves a window from anywhere in it
defaults write -g NSWindowShouldDragOnGesture -bool true

# Fewer animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Menu bar only on hover (SketchyBar is the bar, Opt+-)
defaults write -g _HIHideMenuBar -bool true

# Dock out of the way
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock show-recents -bool false

# AeroSpace recommendations: Spaces don't reorder, Mission Control groups by app,
# one Space across displays (takes effect after logging out)
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.spaces spans-displays -bool true

# Free Cmd+Space for Raycast (disables the Spotlight shortcut)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 \
  '{enabled = 0; value = {parameters = (32, 49, 1048576); type = standard;};}'
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# Never sleep or turn the screen off on its own (battery and charger), not
# even with the lid closed (the screen stays on too). disablesleep
# also blocks Apple menu > Sleep; `sudo pmset -a disablesleep 0` undoes it.
# No screen saver either.
sudo pmset -a sleep 0 displaysleep 0 disksleep 0 disablesleep 1
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Ghostty opens shell scripts and .command files
duti -s com.mitchellh.ghostty public.unix-executable all
duti -s com.mitchellh.ghostty com.apple.terminal.shell-script all

brew services start sketchybar
brew services start borders

killall Dock SystemUIServer 2>/dev/null || true
echo "Done. Log out and back in for the Spaces/menu bar changes."
