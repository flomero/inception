#!/bin/bash
if [ ! -f /run/secrets/wp_db_password ]; then
	echo "No secret found for wp_db_password"
	exit 1
fi
if [ ! -f /run/secrets/wp_user_password ]; then
	echo "No secret found for wp_user_password"
	exit 1
fi
if [ ! -f /run/secrets/wp_admin_password ]; then
	echo "No secret found for wp_admin_password"
	exit 1
fi

WP_DB_PASSWORD = $(cat /run/secrets/wp_db_password)
WP_ADMIN_PASSWORD = $(cat /run/secrets/wp_admin_password)

cd /var/www/html
curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

wp core download \
	--allow-root

# wait for maria db
until nc -z -w50 mariadb 3306
do
	echo "Waiting for MariaDB to start..."
	sleep 1
done

wp config create \
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbhost=$WP_DB_HOST \
	--allow-root \
	--prompt=dbpass < /run/secrets/wp_db_password

wp core install \
	--url=$DOMAIN \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root \
	--prompt=admin_password < /run/secrets/wp_admin_password

wp user create \
	$WP_USER \
	$WP_USER_EMAIL \
	--role=author \
	--allow-root \
	--prompt=user_pass < /run/secrets/wp_user_password

wp plugin install \
	redis-cache \
	--activate \
	--allow-root

wp plugin update \
	--all \
	--allow-root

wp config set WP_CACHE true --raw --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

wp redis enable \
	--allow-root

chown -R www-data:www-data /var/www/html

php-fpm7.4 -F