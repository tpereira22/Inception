#!/bin/bash

echo "\e[0;36m -> SETTING UP MARIADB <- \e[0m"

service mariadb start

if ! mysql -e "USE $MYSQL_DATABASE;"; then
    echo "Database '$MYSQL_DATABASE' does not exist. Creating..."
    
    echo "CREATE DATABASE $MYSQL_DATABASE;" | mariadb
    echo "CREATE USER '$MYSQL_USER'@'' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mariadb
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb
    echo "FLUSH PRIVILEGES;" | mariadb
else
    echo "Database '$MYSQL_DATABASE' already exists. Skipping database setup."
fi

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" | mariadb -uroot -p$MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock 
echo "FLUSH PRIVILEGES;" | mariadb -uroot -p$MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock

exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid