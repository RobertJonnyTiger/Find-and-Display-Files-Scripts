#!/bin/bash
# A script to find files or directories via a search pattern.
clear
read -p "[>] Choose 'f' for files, 'd' for Directories (Default: files): " TYPE
TYPE=${TYPE:-f}

read -p "[>] Input pattern to search for: " PATTERN
find . -type $TYPE -name "$PATTERN" > results.tmp
COUNT=`find . -type $TYPE -name "$PATTERN" | wc -l`

if [[ $TYPE == "f" ]]
then
	TYPE="files"
else 
	TYPE="directories"
fi

clear
echo "[!] You searched for $TYPE with a pattern of: \"$PATTERN\"" 
echo "=============== Results: =============="
echo "[+] find found $COUNT results matching your search."
cat results.tmp
echo "========== End of Results ============="
rm results.tmp
