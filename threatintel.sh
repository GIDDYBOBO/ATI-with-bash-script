#!/bin/bash 
API_KEY="your_api_key_here" # Replace with VirusTotal or AbuseIPDB API Key TARGET_FILE=$1 
OUTPUT_DIR="reports" 
mkdir -p $OUTPUT_DIR 
if [ -z "$TARGET_FILE" ]; then 
echo "Usage: $0 target_list.txt" 
exit 1 
fi 
function whois_lookup() { 
echo "[+] Performing WHOIS Lookup on $1" 
whois $1 > "$OUTPUT_DIR/$1-whois.txt" 
} 
function virus_total_scan() { 
echo "[+] Fetching Threat Intelligence for $1" 
curl -s -X GET "https://www.virustotal.com/api/v3/ip_addresses/$1" \ -H "x-apikey: $API_KEY" | jq '.' > "$OUTPUT_DIR/$1-threatintel.json" } 
function nmap_scan() { 
echo "[+] Scanning Ports on $1" 
nmap -Pn -sV -p- -T4 $1 > "$OUTPUT_DIR/$1-nmap.txt" 
} 
function subdomain_enum() { 
echo "[+] Enumerating Subdomains for $1" 
sublist3r -d $1 -o "$OUTPUT_DIR/$1-subdomains.txt" 
} 
while read target; do 
echo "===== Scanning $target =====" 
whois_lookup $target 
virus_total_scan $target 
nmap_scan $target 
subdomain_enum $target
echo "[+] Report for $target generated!" echo "" 
done < $TARGET_FILE 
echo "[+] All tasks completed!" 
