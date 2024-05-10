#!/bin/bash

# set -x
# Start MariaDB service
service mysql start

while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

# Create a new database
echo "Creating new database..."
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Create a new user and grant privileges to the database
echo "Creating new user and granting privileges..."
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'$MYSQL_HOSTNAME' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"

# echo "Database setup complete!"

# stop MariaDB service
# Wait for MariaDB service to shut down
sleep 5
service mysql stop
# Start MariaDB server
mysqld_safe

