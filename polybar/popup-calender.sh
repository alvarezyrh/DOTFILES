cat << 'EOF' > ~/.config/polybar/popup-calendar.sh
#!/usr/bin/env bash

# Jalankan YAD jika ada, jika tidak ada gunakan Zenity
if command -v yad &> /dev/null; then
    yad --calendar --no-buttons --undecorated --close-on-unfocus --width=220 --height=180 --posy=42 --center=horizontal
elif command -v zenity &> /dev/null; then
    zenity --calendar
fi
EOF

# Beri izin eksekusi wajib
chmod +x ~/.config/polybar/popup-calendar.sh