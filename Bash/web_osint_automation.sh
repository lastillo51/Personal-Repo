#!/bin/bash

# Script that does the following:
# Find subdomains, if they are alive, take screenshots
# By using OSINT tools

# Target domain
domain=$1

# For color coding script promts
RED="\033[1;31m"
RESET="\033[0m"

info_path=$domain/info
subdomain_path=$domain/subdomain
screenshot_path=$domain/screenshots

# Make a folder for the target
if [ ! -d "$domain" ];
then
	mkdir $domain
fi

if [ ! -d "$info_path" ];
then
	mkdir $info_path
fi

if [ ! -d "$subdomain_path" ];
then
	mkdir $subdomain_path
fi

if [ ! -d "$screenshot_path" ];
then
	mkdir $screenshot_path
fi

echo -e "${RED} [+] Cheking who is...${RESET}"
whois $1 > $info_path/whois.txt

# Calls subfinder
# echo -e "${RED} [+] Launching Subfinder...${RESET}"
# subfinder -d $domain >> $subdomain_path/found.txt

# Calls Assetfinder
# echo -e "${RED} [+] Launching Assetfinder...${RESET}"
# assetfinder $domain | grep $domain >> $subdomain_path/found.txt

# Calls Amass
# echo -e "${RED} [+] Launching Amass...this might take a while...${RESET}"
# amass enum -d $domain >> $subdomain_path/found.txt

# Calls httprobe
# echo -e "${RED} [+] Launching httprobe...${RESET}"
# cat $subdomain_path/found.txt | grep $domain | sort -u | httprobe -prefer-https | grep https | sed 's/https\?:\/\///' | tee -a $subdomain_path/alive.txt

# Calls Gowitness
# echo -e "${RED} [+] Launching gowitness...${RESET}"
# gowitness file -f #subdomain_path/alive.txt -P $screenshot_path/ --no-http