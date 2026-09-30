#!/bin/sh

MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    echo "🔇 Muted"
else
    VOL=$(pamixer --get-volume)
    if [ "$VOL" -ge 70 ]; then
        echo "🔊 ${VOL}%"
    elif [ "$VOL" -ge 30 ]; then
        echo "🔉 ${VOL}%"
    else
        echo "🔈 ${VOL}%"
    fi
fi
