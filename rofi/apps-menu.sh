#!/bin/bash

if [ -z "$1" ]; then
    echo -e "Firefox\0icon\x1ffirefox"
    echo -e "Thunar\0icon\x1fthunar"
    echo -e "Kitty\0icon\x1fkitty"
    echo -e "Thunderbird\0icon\x1fthunderbird"
    echo -e "OnlyOffice\0icon\x1fonlyoffice-desktopeditors"
    echo -e "Inkscape\0icon\x1finkscape"
    echo -e "GIMP\0icon\x1fgimp"
    echo -e "Chat\0icon\x1fhexchat"
    echo -e "Antigravity\0icon\x1f/home/vzy/Unduhan/Antigravity-x64/antigravity.png"
    echo -e "Music\0icon\x1f/home/vzy/Gambar/Logo/music.png"
else
    # matiin rofi dulu biar gak freeze
    pkill rofi &
    
    case "$1" in
        "Firefox") nohup firefox >/dev/null 2>&1 & ;;
        "Thunar") nohup thunar >/dev/null 2>&1 & ;;
        "Kitty") nohup kitty >/dev/null 2>&1 & ;;
        "Thunderbird") nohup thunderbird >/dev/null 2>&1 & ;;
        "OnlyOffice") nohup onlyoffice-desktopeditors >/dev/null 2>&1 & ;;
        "Inkscape") nohup inkscape >/dev/null 2>&1 & ;;
        "GIMP") nohup gimp >/dev/null 2>&1 & ;;
        "Chat") nohup zoitechat >/dev/null 2>&1 & ;;
        "Antigravity") nohup /home/vzy/Unduhan/Antigravity-x64/antigravity >/dev/null 2>&1 & ;;
        "Music") nohup kitty -e /home/vzy/.local/bin/ytm >/dev/null 2>&1 & ;;
    esac
fi