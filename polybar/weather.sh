#!/bin/bash
# Mengambil kondisi dan suhu dari wttr.in
DATA=$(curl -s "wttr.in/Jakarta?format=%C+%t")

if [ -z "$DATA" ]; then
    echo "Jakarta 󰖕 N/A"
    exit 0
fi

CONDITION=$(echo "$DATA" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
TEMP=$(echo "$DATA" | awk '{print $2}' | sed 's/+//g')

# Menentukan ikon Nerd Font berdasarkan kata kunci cuaca
case "$CONDITION" in
    *clear*|*sunny*)  ICON="󰖙" ;; # Cerah / Matahari
    *cloud*|*overcast*) ICON="󰖐" ;; # Berawan
    *rain*|*drizzle*)  ICON="󰖗" ;; # Hujan
    *thunder*|*storm*) ICON="󰙾" ;; # Petir / Badai
    *fog*|*mist*)      ICON="󰖑" ;; # Kabut
    *)                 ICON="󰖕" ;; # Default
esac

echo "Jakarta $ICON $TEMP"
