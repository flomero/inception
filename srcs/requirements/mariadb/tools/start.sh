#!/bin/bash

if [ ! -f /run/secrets/wp_db_password ]; then
	echo "No secret found for wp_db_password"
	exit 1
fi

if [ ! -f /run/secrets/wp_db_root_password ]; then
	echo "No secret found for wp_db_root_password"
	exit 1
fi

export WP_DB_PASSWORD=$(cat /run/secrets/wp_db_password)
export WP_DB_ROOT_PASSWORD=$(cat /run/secrets/wp_db_root_password)

envsubst < /etc/mysql/init.sql > /etc/mysql/tmp.sql
mv /etc/mysql/tmp.sql /etc/mysql/init.sql

mysql_install_db
mysqld