#!/data/data/com.termux/files/usr/bin/bash

echo "[+] Menginstall dependensi..."
pkg update -y && pkg install -y curl jq inetutils

echo "[+] Downloading maulanTech-NetScan..."
curl -sLo $PREFIX/bin/maulanTech-netscan https://raw.githubusercontent.com/MaulanaDevtech422/ToolsMaulantech/main/maulantech-netscan.sh
chmod +x $PREFIX/bin/maulanTech-netscan

echo "[✓] Instalasi selesai! Jalankan dengan perintah: maulanTech-netscan"
