#!/bin/bash

new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)
clear
echo -e "Abuse Defender Installed"
sleep 2
clear

sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)"
clear
echo -e "ufw Configed"
sleep 2
clear

sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

sudo systemctl restart sshd
clear
echo -e "systemctl Restarted"
sleep 2
clear

echo -e "New SSH Port : $new_port"
