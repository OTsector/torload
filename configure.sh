#!/bin/bash
sudo apt-get install proxychains tor -y
sudo cp -R torload pc /usr/bin -f
sudo chmod +x /usr/bin/torload
sudo chmod +x /usr/bin/pc
echo "Done! -Now? ... Nobody's win!"
sudo rm -rf ../torload
exit 0
