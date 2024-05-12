#!/bin/sh

# Check if wp-config.php exists
if [ -f ./wp-config.php ]; then
    echo "WordPress already installed"
else
    # chown -R www-data:www-data /var/www/html/wordpress

    # Import environment variables into the config file
    sleep 15
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

    # Create the second user
    wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --allow-root
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F

