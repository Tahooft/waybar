#!/bin/bash

# wallpaper() {
    wallpaper=$(find ~/Pictures/Wallpapers/Using/  -type f | shuf -n 1)
    killall swaybg
    sleep 0.05
    swaybg -i  $wallpaper -o '*' &
    disown
# }