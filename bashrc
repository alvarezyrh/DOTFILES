# ==========================================
# VZY-RMDHNI - FUTURISTIC BASHRC THEME
# ==========================================

vzy_prompt() {
    # Tampilan ASCII Art & Sistem Status (Hanya muncul saat terminal pertama dibuka/refresh besar)
    if [ "$VZY_INIT" != "1" ]; then
        export VZY_INIT="1"
        
        # Warna ANSI Escape (Variabel Lokal Fungsi)
        local c_blue="\e[1;34m"        # Biru Tua Terang (Bold Blue)
        local c_navy="\e[38;5;19m"     # Biru Tua Pekat (Dark Navy)
        local c_blue_alt="\e[38;5;25m" # Biru Tua Aksen
        local c_reset="\e[0m"
        local c_dim="\e[2m"

        # Ambil data Memory (RAM) dalam persen (%)
        local mem_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
        
        # Ambil data Disk (Root /) dalam persen (%)
        local disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
        
        # Ambil data Suhu Prosesor (CPU Temp)
        local cpu_temp="N/A"
        if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
            local raw_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
            cpu_temp=$((raw_temp / 1000))°C
        elif command -v sensors &> /dev/null; then
            cpu_temp=$(sensors | awk '/Core 0/ {print $3}' | head -n 1)
        fi

        clear
        echo -e "${c_blue}╔══════════════════════════════════════════════════════════╗${c_reset}"
        echo -e "${c_blue}║${c_blue_alt}            ____   __  __ ____  _   _ _   _ ___           ${c_blue}║${c_reset}"
        echo -e "${c_blue}║${c_blue_alt}           |  _ \ |  \/  |  _ \| | | | \ | |_ _|          ${c_blue}║${c_reset}"
        echo -e "${c_blue}║${c_blue_alt}           | |_) || |\/| | | | | |_| |  \| || |           ${c_blue}║${c_reset}"
        echo -e "${c_blue}║${c_blue_alt}           |  _ < | |  | | |_| |  _  | |\  || |           ${c_blue}║${c_reset}"
        echo -e "${c_blue}║${c_blue_alt}           |_| \_\|_|  |_|____/|_| |_|_| \_|___|          ${c_blue}║${c_reset}"
        echo -e "${c_blue}╠══════════════════════════════════════════════════════════╣${c_reset}"
        echo -e "${c_blue}║            SYSTEM : ONLINE   USER : ${USER}@${HOSTNAME}           ║${c_reset}"
        echo -e "${c_blue}╚══════════════════════════════════════════════════════════╝${c_reset}"
        
        # Baris Informasi Real-time (RAM, Disk, Suhu, Waktu)
        echo -e "${c_blue}╔═══════════════════════ SYS-STATUS ═══════════════════════╗${c_reset}"
        echo -e "${c_blue}║ ${c_reset} ${c_blue_alt}RAM:${c_reset} ${mem_usage}% ${c_blue}│${c_reset} ${c_blue_alt}DISK:${c_reset} ${disk_usage}% ${c_blue}│${c_reset} ${c_blue_alt}CPU TEMP:${c_reset} ${cpu_temp} ${c_blue}│${c_reset} ${c_blue_alt}TIME:${c_reset} $(date +%T) ${c_blue} ║${c_reset}"
        echo -e "${c_blue}╚══════════════════════════════════════════════════════════╝${c_reset}\n"
    fi

    # --------------------------------------------------------------------------
    # SEGMENT POWERLINE PROMPT (Fedora Deep Blue Theme)
    # --------------------------------------------------------------------------
    local BG_NAVY="\[\e[48;5;19m\]"     # Biru Tua Pekat / Deep Navy
    local FG_NAVY="\[\e[38;5;19m\]"
    local BG_BLUE="\[\e[48;5;33m\]"     # Biru Fedora / Cerah
    local FG_BLUE="\[\e[38;5;33m\]"
    local FG_WHITE="\[\e[38;5;255m\]"
    local RESET="\[\e[0m\]"

    # Segmen 1: Logo Fedora () + Username (Latar Biru Tua Pekat)
    local SEG1="${BG_NAVY}${FG_WHITE}  ${USER} ${RESET}${FG_NAVY}${BG_BLUE}${RESET}"
    
    # Segmen 2: Working Directory (Latar Biru Aksen)
    local SEG2="${BG_BLUE}${FG_WHITE} \w ${RESET}${FG_BLUE}${RESET}"

    # Simbol Prompt Input Akhir (Baris Baru + Panah Bawah ▼ Warna Biru Tua)
    PS1="${SEG1}${SEG2}\n\[\e[1;34m\]▼ \[\e[0m\]"
}

# Kaitkan fungsi ke PROMPT_COMMAND
PROMPT_COMMAND=vzy_prompt

# Environment & PATH
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

export PATH="$HOME/.local/bin:$PATH"
