#!/bin/bash
# A script to present files 1-by-1 via user input for patern.
# Presents the name, location and cats the contents of the file.
# Waits for user's Enter to present the next file in the iteration of `find`.
clear
read -p "[>] Input pattern to search for: " PATTERN
COUNT=`find . -type f -name "$PATTERN" | wc -l`
ITER=`find . -type f -name "$PATTERN" | wc -l`
for FILE in `find . -type f -name "$PATTERN"`; do
	clear
	echo "[V] find found $COUNT files matching your pattern: \"$PATTERN\""
	echo "[!] Showing result $ITER/$COUNT: "
	echo -ne "    [!] File Name: "; echo $FILE
	echo "    [!] Content:"
	echo "========================================="
	cat $FILE
	read n
	ITER=$(expr $ITER - 1)
done
echo "============= End of Results ==============="
	
