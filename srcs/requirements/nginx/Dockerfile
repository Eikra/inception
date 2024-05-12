# Use Debian 10 (buster) as the base image
FROM debian:buster-slim

# Install NGINX, openssl (for generating self-signed certificate), and bash (for shell)
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Remove default NGINX website
RUN rm -rf /var/www/html/*

# Copy custom NGINX configuration
COPY conf/default /etc/nginx/sites-available/default

# nginx config
RUN mkdir -p /run/nginx
# Copy the script and give the right permissions
COPY ./tools/start_nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_nginx.sh

CMD [ "start_nginx.sh" ]


