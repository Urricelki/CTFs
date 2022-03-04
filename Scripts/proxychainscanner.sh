#!/bin/bash
echo " PORT SCANNING .... "

for port in {1..65536}; do
	for l in $(seq 1 254); do
		proxychains timeout 1 bash -c "echo '' >  /dev/tcp/192.168.1.$l/$port" 2>/dev/null && echo "[+] Port $port - OPEN on host 192.168.1.$l" &
		done ; wait
done
