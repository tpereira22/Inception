#!/bin/sh

sleep 15

cd /var/www/html


if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if ! wp core is-installed --path=/var/www/html --allow-root; then

    wp cli update --yes --allow-root

    wp core download --allow-root

    wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root --path=/var/www/html

    wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html

    wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role="$WP_USER_ROLE" --allow-root --path=/var/www/html

    wp theme install astra --activate --allow-root --path=/var/www/html

    # wp plugin update --all --allow-root --path=/var/www/html
else
    echo "WordPress is already installed."
fi

echo "Start php-fpm7.4"
exec /usr/sbin/php-fpm7.4 -F