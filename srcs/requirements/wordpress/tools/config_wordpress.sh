#!/bin/sh
if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	cd /var/www/html

	wp core download --allow-root

	wp config create \
		--allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=$MYSQL_HOSTNAME \
		--path=/var/www/html/ \
		--force

	wp core install \
		--allow-root \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_LOGIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL

	wp user create \
		--allow-root \
		$WP_USER_LOGIN \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD;
fi

exec "$@"