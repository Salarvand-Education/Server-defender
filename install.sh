#!/bin/bash

# Get new port
new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

# Install Abuse Defender
bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)
clear
echo -e "Abuse Defender Installed"
sleep 2
clear

# Update SSH Port (works for both commented and uncommented cases)
sudo sed -i -E "s/^#?Port .*/Port $new_port/" /etc/ssh/sshd_config

# Add port if not exists (safety check)
grep -q "^Port $new_port" /etc/ssh/sshd_config || echo "Port $new_port" | sudo tee -a /etc/ssh/sshd_config


# Restart SSH
sudo systemctl restart sshd
clear
echo -e "SSH Service Restarted"
sleep 2
clear

# Install UFW rules
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)"
clear
echo -e "UFW Configured"
sleep 2
clear

# Show result
echo -e "\033[1;32mSuccess!\033[0m New SSH Port: \033[1;36m$new_port\033[0m"
