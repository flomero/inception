#!/bin/bash

if [ ! -f /run/secrets/ftp_password ]; then
	echo "No secret found for ftp_password"
	exit 1
fi

export FTP_PASS=$(cat /run/secrets/ftp_password)

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
chown $FTP_USER:$FTP_USER /home/$FTP_USER

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf