#!/bin/bash

if [ $# -lt 1 ]; then
	echo "use: "$0" [hostname] [nmap arguments]"
	exit 1
fi

hostname="$1"
argvArray=($@)

for((i=1; i<$#; i++)); do
	argv+="${argvArray[$i]} "
done

tor-resolve $hostname|pc nmap -sT -PN -n -sV $argv $(cat)

