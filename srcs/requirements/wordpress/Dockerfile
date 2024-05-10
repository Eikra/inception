FROM debian:buster-slim

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	php \
	php-fpm \
	php-mysql \
	php-gd \
	php-mbstring \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Create the folder to enable PHP start
RUN mkdir /run/php

# Copy the script and give the right permissions
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh

# Set the working directory
WORKDIR /var/www/html/

# Download WordPress and configure it
RUN wget https://wordpress.org/latest.tar.gz \
  && tar xfz latest.tar.gz \
  && mv wordpress/* . \
  && rm -rf latest.tar.gz wordpress

# Command to run the script
CMD ["/usr/local/bin/create_wordpress.sh"]

