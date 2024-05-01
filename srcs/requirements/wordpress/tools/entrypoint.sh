#!/bin/bash

# Download and extract WordPress
wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
cd /var/www && \
tar -xzf wordpress-6.0-fr_FR.tar.gz && \
rm wordpress-6.0-fr_FR.tar.gz && \
chown -R root:root /var/www/wordpress

# Download and install WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

# Start PHP-FPM
php-fpm7.4 -F
