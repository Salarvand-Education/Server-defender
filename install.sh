#!/bin/bash

bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)
clear
echo "Abuse Defender Installed"

wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && bash bbr.sh
clear
echo "Server Optimizer Installed"

new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

sudo systemctl restart sshd
clear
echo "systemctl Is Restarted"

clear

echo -e "New Ssh Port is : $new_port"
