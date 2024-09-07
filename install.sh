#!/bin/bash

 bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)
clear
echo "Abuse Defender Installed"

new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

sudo systemctl restart sshd
clear
echo "systemctl Is Restarted"

clear

echo -e "New Ssh Port is : $new_port"
