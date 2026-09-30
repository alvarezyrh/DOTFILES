#!/bin/sh

# Format Rofi Script Mode: "Teks Opsi\0icon\x1fNama_Ikon"
if [ -z "$1" ]; then
    echo -e "Kunci Layar\0icon\x1fsystem-lock-screen"
    echo -e "Keluar Sesi\0icon\x1fsystem-log-out"
    echo -e "Mulai Ulang\0icon\x1fsystem-reboot"
    echo -e "Matikan Komputer\0icon\x1fsystem-shutdown"
else
    case "$1" in
        "Kunci Layar")
            betterlockscreen -l blur || i3lock || slock
            ;;
        "Keluar Sesi")
            bspc quit
            ;;
        "Mulai Ulang")
            systemctl reboot
            ;;
        "Matikan Komputer")
            systemctl poweroff
            ;;
    esac
fi