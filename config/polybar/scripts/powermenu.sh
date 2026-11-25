#!/bin/bash

choice=$(printf '󰍃  Logout\n󰜉  Reboot\n󰐥  Shutdown\n󰑐  Cancel\n' | rofi -dmenu -i -p "Power")

case "$choice" in
    *Logout)
        pkill -x xmonad
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
esac
