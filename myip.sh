#!/bin/bash
curl -s -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0' \
	checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
exit 0
