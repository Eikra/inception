#!/bin/bash

# Start MariaDB service
service mysql start

# Create a new database
echo "Creating new database..."
mysql -e "CREATE DATABASE $MYSQL_DATABASE;"

# Create a new user and grant privileges to the database
echo "Creating new user and granting privileges..."
mysql  -e "CREATE USER '$MYSQL_USER'@'$MYSQL_HOSTNAME' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql  -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$MYSQL_HOSTNAME';"
mysql -e " GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'iecharak'@'%' IDENTIFIED BY 'new1234';"
mysql  -e "FLUSH PRIVILEGES;"

echo "Database setup complete!"

# # Keep the container running
# exec "$@"
# Shutdown MariaDB service
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Start MariaDB server
mysqld_safe

