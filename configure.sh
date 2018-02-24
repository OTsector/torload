#!/bin/bash
sudo apt-get install proxychains tor curl -y
sudo cp -R pc myip torload /usr/bin -f
sudo chmod +x /usr/bin/pc
sudo chmod +x /usr/bin/myip
sudo chmod +x /usr/bin/torload
sudo sed 's/proxy_dns/#proxy_dns/g' -i /etc/proxychains.conf
clear
echo "Done! -Now? ... Nobody's win!"
exit 0
