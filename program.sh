#!/bin/bash

# License and so on

# This program will fetch words from a few websites
# It will take words using a pattern
# Adjective Noun Verb Adjective

# According to XKCD, it's a good way to create passwords, since it's hard to guess words if they're random, or "pseudo-random"



# Pattern to match

# Ping timeout period (seconds)
TIMEOUT=2

# Ping each site. Report back
#WEBSITES=[]
declare -a WEBSITES=('textfixer.com' '8.8.8.8')

# Check the ping
:'for i in "${WEBSITES[@]}"
do
	if ping -W "$TIMEOUT" -c 1 "$i" >/dev/null 2>&1;
	then
		echo "$i OK"
	else
		echo "Ow no, $i seems to be offline..."
	fi
done
'
TEXTFIXER=""
DBG=1
echo "DBG: ${WEBSITES[@]}"
:'
for i in "${WEBSITES[@]}"
do
	if [ $i == "textfixer.com" ]
	then
		DBG="$DBG"+1
		#	POSTVAR="random-words="
		TEXTFIXER=$(wget "http://www.textfixer.com/tools/random-words.php" -q -O -)
		#cat "$TEXTFIXER"	
	fi
	
done
'
echo "DBG:$DBG"
