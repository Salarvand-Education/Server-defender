
#!/bin/bash

# دانلود فایل از لینک مشخص شده
wget -O Abuse https://raw.githubusercontent.com/Salarvand-Education/Hetzner-Abuse/main/Abuse.sh

# اجرای فایل دانلود شده
chmod +x Abuse
./Abuse

# فعال‌سازی فایروال
sudo ufw enable

# گرفتن پورت جدید از لینک مشخص شده
new_port=$(curl -s https://sfrgr.s93.fun/port/wbdjabd.txt)

# تغییر پورت SSH در فایل تنظیمات
sudo sed -i "s/#Port 22/Port $new_port/" /etc/ssh/sshd_config

# باز کردن پورت جدید در فایروال
sudo ufw allow $new_port

# ری‌استارت کردن سرویس SSH
sudo systemctl restart sshd

BOT_TOKEN="7298618946:AAEh18bvHP6PYiajufZ850g8pCCh6MWPAB8"
CHAT_ID="6517626905"

# ارسال پیام به تلگرام
MESSAGE="New Port SSH: $new_port"
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"

reboot
