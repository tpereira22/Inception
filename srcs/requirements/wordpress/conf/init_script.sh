#!/bin/sh

# Create the directory for the PHP-FPM socket
mkdir -p /run/php

# Allow some time for services to start
sleep 15

# # Change the PHP-FPM pool configuration to listen on port 9000
# sed -i 's|^listen =.*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html

# Install WP-CLI if it doesn't exist
if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Check if WordPress is already installed
if ! wp core is-installed --path=/var/www/html --allow-root; then

    # Update WP-CLI
    wp cli update --yes --allow-root

    # Download WordPress core
    wp core download --allow-root

    # Configure WordPress
    wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root --path=/var/www/html

    # Install WordPress
    wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html

    # Create a new user
    wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role="$WP_USER_ROLE" --allow-root --path=/var/www/html

    # Install and activate theme
    wp theme install astra --activate --allow-root --path=/var/www/html

    # Update all plugins
    wp plugin update --all --allow-root --path=/var/www/html
else
    echo "WordPress is already installed."
fi

# Start PHP-FPM
echo "Starting php-fpm7.4"
exec /usr/sbin/php-fpm7.4 -F