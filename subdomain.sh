#!/bin/bash

# Made by 0 |) 1 |\|

# @OdinF13/BB_scripts/SUBDOMAIN_CRT.sh

for domain in "$@"; do
	curl -A 'Googlebot' -s 'https://crt.sh?q='$domain'&output=json' \
		| jq .[].name_value \
		| sed 's/\\n/\n/g; s/"//g; /^\*\./d' \
		| sort | uniq
done
