#!/bin/bash

 bash <(curl -s https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh)

# گرفتن پورت جدید از لینک مشخص شده
new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

# باز کردن پورت ssh 
sudo ufw allow $new_port

# تغییر پورت SSH در فایل تنظیمات
sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

# باز کردن پورت جدید در فایروال
sudo ufw enable

# ری‌استارت کردن سرویس SSH
sudo systemctl restart sshd

BOT_TOKEN="7298618946:AAEh18bvHP6PYiajufZ850g8pCCh6MWPAB8"
CHAT_ID="6517626905"

# ارسال پیام به تلگرام
MESSAGE="New Port SSH: $new_port"
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"

reboot
