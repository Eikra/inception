# Use the latest Debian slim image
FROM debian:bullseye-slim

# Install PHP and other dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/php && \
    touch /run/php/php7.4-fpm.sock

COPY ./tools/entrypoint.sh /
# Copy PHP-FPM configuration
COPY conf/php-fpm.conf /usr/local/etc/php-fpm.conf

# Set the CMD to start PHP-FPM in the foreground

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]