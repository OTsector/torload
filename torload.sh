#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 6`
yellow=`tput setaf 3`
reset=`tput sgr0`

service tor start &> /dev/null

re='^[0-9]+$'
if [[ $1 =~ $re ]] ; then
		service tor reload &> /dev/null
	while [[ true ]]; do
		sleep $1s
		service tor reload &> /dev/null
		{
		if ! [[ "$2" = "--hidden" ]]; then
			myip=$(pc myip)
		fi
		} &>> /dev/null

		if ! [[ "$2" = "--hidden" ]]; then
			echo "Current ${red}IP${reset} is: "${green}$myip${reset}
		fi
	done
else
	echo -e "\nuse: torload ${green}[second]${reset} , or: torload ${green}[second]${reset} --${blue}hidden${reset}\n\n////////////////\nFor example:\n${yellow}torload 5 --hidden${reset}\n////////////////\n"
fi

exit 0
