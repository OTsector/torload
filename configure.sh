#!/bin/bash
sudo apt-get update
sudo apt-get install proxychains tor curl -y
sudo systemctl enable tor
sudo echo -e '#!/bin/bash\nproxychains 2> /dev/null "$@"\n' > /usr/bin/pc
sed 's/^echo "ProxyChains/#&/g' -i /usr/bin/proxychains 
sudo cp myip.sh /usr/bin/myip
sudo cp torload.sh /usr/bin/torload
sudo cp pcnmap.sh /usr/bin/pcnmap
sudo cp subdomain.sh /usr/bin/subdomain
sudo chmod +x /usr/bin/pc
sudo chmod +x /usr/bin/myip
sudo chmod +x /usr/bin/torload
sudo chmod +x /usr/bin/pcnmap
sudo chmod +x /usr/bin/subdomain
sudo sed 's/#quiet_mode/quiet_mode/g' -i /etc/proxychains*.conf
# sudo sed 's/proxy_dns/#proxy_dns/g' -i /etc/proxychains.conf
clear
echo "Done! -Now? ... Nobody's win!"
exit 0
