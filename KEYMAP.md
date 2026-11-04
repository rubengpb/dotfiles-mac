# macOS keymap

One rule: **each modifier belongs to one owner**.

| Layer | Owner |
|---|---|
| `Opt` | AeroSpace: windows, workspaces, apps, system |
| `Cmd` | applications (the Linux `Ctrl`) |
| `Ctrl` | terminal, vim, tmux (`C-Space` prefix, `C-hjkl` panes) |
| `Opt` + keys AeroSpace leaves alone | Alt in Ghostty for tmux (`M-,` `M-.` `M-1…5`); typing `~ € \| @ #` etc. |

AeroSpace takes `Opt+key` from both Option keys, so it never binds `ñ` (`~`), `e` (`€`)
or `1/2/3` (`| @ #`). Check this before adding a binding.

## Keyboard (Karabiner)
| Key | Becomes |
|---|---|
| Caps Lock | `Esc` |
| Esc | Caps Lock |
| fn / Globe (bottom-left corner) | `Ctrl` (built-in keyboard only) |
| Ctrl | fn / Globe |

## Windows (AeroSpace)
| Keys | Action |
|---|---|
| `Opt+h/j/k/l` | focus left / down / up / right |
| `Opt+Shift+h/j/k/l` | move the window |
| `Opt+x` `Opt+r` | close / fullscreen |
| `Opt+t` | float / tile |
| `Opt+v` `Opt+w` | tiles / accordion (press again: flip orientation) |
| `Opt+s` | resize mode: `hjkl`, `=` balance, `Esc` out |
| `Opt+m` | service mode: `Esc` reload config, `r` reset layout, `f` float, `⌫` close the others |
| `Cmd+Ctrl` + drag | move a window with the mouse |

## Workspaces
| Keys | Action |
|---|---|
| `Opt+y/u/i/o/p` | workspace 1–5 |
| `Opt+Shift+y/u/i/o/p` | send the window there |
| `Opt+Tab` | last workspace |
| `Opt+Shift+Tab` | workspace to the next monitor |

## Apps and system
| Keys | Action |
|---|---|
| `Opt+a` | Ghostty (attaches to the running tmux) |
| `Opt+Shift+t` | Terminal.app, plain shell without tmux |
| `Opt+f` `Opt+d` `Opt+z` | Firefox / Brave / Zen |
| `Opt+g` | home folder in Finder |
| `Opt+Shift+s` | System Settings |
| `Ctrl+Shift+Esc` | Activity Monitor |
| `Cmd+Space` | Raycast |
| `Opt+-` | show / hide SketchyBar |
| `Opt+c` `Opt+Shift+c` | screenshot of a region to clipboard / Screenshot app |

## tmux
| Keys | Action |
|---|---|
| `Opt+,` `Opt+.` | previous / next window |
| `Opt+1…5` | sessionizer: aura, personal, tfg, normal, dotfiles |
| `C-Space f` | sessionizer picker (fzf) |
