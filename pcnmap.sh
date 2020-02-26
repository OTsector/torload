#!/bin/bash

if [ $# -lt 1 ]; then
	nmap --help|sed 's/nmap/pcnmap/g'
	exit 1
fi

service tor start &> /dev/null

argvArray=($@)

for((i=0; i<$#; i++)); do
	if [ $i -ne 0 ] \
		&& [[ ${argvArray[$i-1]::2} != "-p" ]] \
		|| [[ ${argvArray[$i]::1} != "-" ]]; then
			if [[ $hostname == "" ]]; then
				hostname=${argvArray[$i]}
			fi
	fi
	argv+="${argvArray[$i]} "
done

argv=$(sed "s/$hostname//g" <<< $argv)
replace=$(sed 's/.*-p //g;s/\ -.*//g' <<< $argv)
replacement=$(sed 's/.*-p //g;s/ -.*//g' <<< $argv|tr " " ",")
argv=$(sed "s/$replace/$replacement/g" <<< $argv)

if [[ ${hostname:${#hostname}-6} == ".onion" ]]; then
	host=$hostname
	torsocks 2>/dev/null nmap -sT -Pn -n $argv $host \
		|sed 's/nmap/pcnmap/g'
else
	host=$(tor-resolve $hostname)||exit 1
	pc nmap -sT -Pn -n $argv $host \
		|sed 's/nmap/pcnmap/g'
fi
echo $host

