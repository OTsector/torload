#!/bin/bash
sudo apt-get install proxychains tor -y
sudo cp -R pc myip torload /usr/bin -f
sudo chmod +x /usr/bin/pc
sudo chmod +x /usr/bin/myip
sudo chmod +x /usr/bin/torload
sudo rm -rf ../torload
cd ..
clear
echo "Done! -Now? ... Nobody's win!"
exit 0
