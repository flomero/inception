#!/bin/bash

if [ ! -f /run/secrets/ftp_password ]; then
	echo "No secret found for ftp_password"
	exit 1
fi

export FTP_PASS=$(cat /run/secrets/ftp_password)

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
chown $FTP_USER:$FTP_USER /home/$FTP_USER
chown -R $FTP_USER:$FTP_USER /var/www/html

mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

echo "pasv_address=$DOMAIN" >> /etc/vsftpd/vsftpd.conf

rsyslogd -n &

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf