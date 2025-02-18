#!/bin/bash

# رنگ‌ها
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

# دریافت پورت جدید
new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

# بررسی مقدار دریافت شده
if [[ -z "$new_port" ]]; then
    echo -e "${RED}Error:${RESET} Failed to retrieve the new port!"
    exit 1
fi

# نصب Abuse Defender
echo -e "${CYAN}Installing Abuse Defender...${RESET}"
bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh) && \
echo -e "${GREEN}Abuse Defender Installed!${RESET}"

# تغییر پورت SSH
echo -e "${CYAN}Updating SSH port to $new_port...${RESET}"
sudo sed -i -E "s/^#?Port .*/Port $new_port/" /etc/ssh/sshd_config
grep -q "^Port $new_port" /etc/ssh/sshd_config || echo "Port $new_port" | sudo tee -a /etc/ssh/sshd_config

# راه‌اندازی مجدد SSH
echo -e "${CYAN}Restarting SSH service...${RESET}"
if sudo systemctl restart sshd; then
    echo -e "${GREEN}SSH Service Restarted Successfully!${RESET}"
else
    echo -e "${RED}Error:${RESET} Failed to restart SSH service!"
    exit 1
fi

# نصب UFW و تنظیم قوانین
echo -e "${CYAN}Configuring UFW...${RESET}"
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/Salarvand-Education/Auto-ufw/main/ufw.sh)" && \
echo -e "${GREEN}UFW Configured Successfully!${RESET}"

# نمایش پورت جدید
echo -e "${GREEN}Success!${RESET} New SSH Port: ${CYAN}$new_port${RESET}"
