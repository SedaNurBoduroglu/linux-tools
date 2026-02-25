#!/bin/bash 


#colour specifications
GREEN = '\033[0;32m'
BLUE = '\033[0;34m'
NC = '\033[0m'


echo -e "${BLUE}================================${NC}"
echo -e "${GREEN} SİSTEM SAĞLIK RAPORU (macOS)   ${NC}" 
echo -e "${BLUE}================================${NC}"
date

#1.Disc state
echo -e "${BLUE}[1] Disk Kullanımı:${NC}"
df -h | grep '/dev/disk' | awk '{print $1 " : " $5 " dolu" }'

#2. Memory (RAM) state -special for macOS
echo -e "\n${BLUE}[2] Bellek Bilgisi:${NC}"
vm_stat | perl -ne 'page size of (\d+) bytes/ && ($=s$1); /Pages free:\s+(\d+)/ && printf ("Boş RAM: %.2f GB\n",$1*$s/1024**3)'  

#3. CPU 
echo -e "\n${BLUE}[3] CPU Ortalama Yükü (1, 5, 15 dk):${NC}"
sysctl -n vm.loadavg | awk '{print "1 dk: " $2 " | 5 dk: " $3 " | 15 dk: " $4}'

echo -e "\n${BLUE}==============================${NC}"
