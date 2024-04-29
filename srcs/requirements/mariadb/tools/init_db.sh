#!/bin/bash

set -e

# Start MariaDB service
export SQL_DATABASE=mydatabase
export SQL_USER=myuser
export SQL_PASSWORD=mypassword
export SQL_ROOT_PASSWORD=rootpassword
service mysql start

# Wait for MariaDB service to be ready
until mysqladmin ping &>/dev/null; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

# Execute MySQL commands to initialize database and users
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MariaDB service
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Start MariaDB server
mysqld_safe
