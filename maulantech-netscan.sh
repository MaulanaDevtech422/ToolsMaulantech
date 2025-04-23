#!/data/data/com.termux/files/usr/bin/bash

# Warna
green='\033[1;32m'
blue='\033[1;34m'
nc='\033[0m'

# ASCII Banner
clear
echo -e "${green}"
cat << "EOF"
 __  __           _       _____         _     
|  \/  | ___   __| | ___ | |_ _|_ _ ___| |__  
| |\/| |/ _ \ / _` |/ _ \| || || '_/ -_) '_ \ 
|_|  |_|\___/ \__,_|\___/|_|___|_| \___|_.__/ 
            maulanTech NetScan
EOF
echo -e "${nc}"

# Cek IP Lokal
echo -e "${blue}[+] IP Lokal:${nc}"
ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}'

# Cek IP Publik dan ISP
echo -e "${blue}\n[+] IP Publik dan ISP Info:${nc}"
curl -s https://ipinfo.io | jq '.ip, .city, .region, .country, .org'

# Cek DNS
echo -e "${blue}\n[+] DNS Resolver:${nc}"
getprop net.dns1
getprop net.dns2

# Cek perangkat aktif di jaringan lokal
echo -e "${blue}\n[+] Perangkat aktif di jaringan (ping sweep):${nc}"
ip_prefix=$(ip a | grep inet | grep wlan | awk '{print $2}' | cut -d'.' -f1-3)
for i in $(seq 1 10); do
  ping -c 1 -W 1 ${ip_prefix}.$i > /dev/null && echo "[✔] ${ip_prefix}.$i aktif" &
done
wait

echo -e "\n${green}[✓] Selesai.${nc}"
