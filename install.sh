#!/bin/bash

 bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)
clear
echo "Abuse Defender Installed"
# گرفتن پورت جدید از لینک مشخص شده
new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

# تغییر پورت SSH در فایل تنظیمات
sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

# ری‌استارت کردن سرویس SSH
sudo systemctl restart sshd
clear
echo "systemctl Is Restarted"

echo -e "New Ssh Port is : $new_port"
