# Use the latest Debian slim image
FROM debian:bullseye-slim

# Install PHP and other dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/php && \
    touch /run/php/php7.4-fpm.sock

# Download and extract WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

# Download and install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration
COPY conf/php-fpm.conf /usr/local/etc/php-fpm.conf

# Set the CMD to start PHP-FPM in the foreground
CMD ["php-fpm7.4", "-F"]
