#!/bin/bash

# Set XMonad wallpaper
feh --no-fehbg --bg-fill \
"$HOME/Pictures/wallpaper/wallpaper_xmonad.jpg" &

# Start compositor for transparency
pgrep -x picom >/dev/null || picom --daemon --backend glx

# Start Tokyo Night Polybar
polybar -c "$HOME/.config/polybar/config.ini" xmonad \
  >> "$HOME/.config/polybar/xmonad.log" 2>&1 &
