#!/bin/bash

# Start MariaDB service
service mysql start

# Create a new database
echo "Creating new database..."
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# Create a new user and grant privileges to the database
echo "Creating new user and granting privileges..."
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'$MYSQL_HOSTNAME' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

echo "Database setup complete!"

# Shutdown MariaDB service
# mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
service mysql stop

# Start MariaDB server
mysqld_safe

