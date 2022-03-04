#!/bin/bash
function ctrl_c(){
  echo -e "\n\n[!] Saliendo... \n"
  tput cnorm; exit 1
}
#Ctrl+C
trap ctrl_c INT

tput civis
#Cambia la ipp // Change the ipp
declare -a hosts=(192.168.1.1 192.168.1.2 192.168.1.3) 

for host in ${hosts[@]}; do
    echo -e "\n[+] Enumerando el host $host:\n"
    for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$host/$port" 2>/dev/null && echo -e "\t[+] Port $port - OPEN"
    done; wait
done

tput cnorm
