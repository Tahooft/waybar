#!/bin/bash
case $(wofi -d -L 6 -l 3 -W 100 -x -100 -y 10 \
    -D dynamic_lines=true << EOF | sed 's/^ *//'
    Shutdown
    Reboot
    Log off
    Sleep
    Lock
    Cancel
EOF
) in
    "Shutdown")
        pkill --signal RTMIN+13 firefox
        systemctl poweroff
        ;;
    "Reboot")
        pkill --signal RTMIN+13 firefox
        systemctl reboot
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Lock")
        loginctl lock-session
        ;;
    "Log off")
        pkill --signal RTMIN+13 firefox
        swaymsg exit
        ;;
esac