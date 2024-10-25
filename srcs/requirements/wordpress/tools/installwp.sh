#!/bin/bash
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
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$WP_DB_HOST \
	--allow-root

wp core install \
	--url=$DOMAIN \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root

wp user create \
	$WP_USER \
	$WP_USER_EMAIL \
	--role=author \
	--user_pass=$WP_USER_PASSWORD \
	--allow-root

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