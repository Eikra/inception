# Use the penultimate stable version of Debian as the base image
FROM debian:bullseye-slim

# Install WordPress and php-fpm
RUN apt-get update && apt-get install -y wordpress php7.3-fpm && rm -rf /var/lib/apt/lists/*

# Copy php-fpm configuration
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

# CMD to start php-fpm in the foreground
CMD ["php-fpm7.3", "-F"]
