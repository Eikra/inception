#!/bin/sh

# Check if wp-config.php exists
if [ -f ./wp-config.php ]; then
    echo "WordPress already installed"
else
    # Download WordPress and configure it
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz wordpress

    # Import environment variables into the config file
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    # wp user create --allow-root  $WP_USR $WP_EMAIL --user_pass=$WP_PWD 
    wp user create --allow-root  $WP_USR $WP_EMAIL --user_pass=$WP_PWD  --path=/var/www/html/wordpress/

    echo "WordPress installed successfully"
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F

# #!/bin/sh

# #check if wp-config.php exist
# # if [ -f ./wp-config.php ]
# # then
# # 	echo "wordpress already downloaded"
# # else

# #Download wordpress and all config file
# sleep 10
# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# rm -rf latest.tar.gz
# rm -rf wordpress

# #Inport env variables in the config file
# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# cp wp-config-sample.php wp-config.php

# # fi

# # exec "$@"
# /usr/sbin/php-fpm7.3 -F