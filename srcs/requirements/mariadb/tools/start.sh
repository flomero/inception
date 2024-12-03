#!/bin/bash

WP_DB_PASSWORD=$(cat /run/secrets/wp_db_password)

envsubst < /etc/mysql/init.sql > /etc/mysql/tmp.sql
mv /etc/mysql/tmp.sql /etc/mysql/init.sql

mysql_install_db
mysqld