#!/bin/sh

sleep 15

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress

wp core download --allow-root

wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root

wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role="$WP_USER_ROLE" --allow-root


wp theme install astra --activate --allow-root

wp plugin update --all --allow-root
