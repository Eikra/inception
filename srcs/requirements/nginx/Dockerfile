# Use Debian 10 (Buster) as the base image
FROM debian:buster-slim

# Install NGINX, openssl (for generating self-signed certificate), and bash (for shell)
RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y nginx openssl bash && \
    rm -rf /var/lib/apt/lists/*

# # Remove default NGINX website
RUN rm -rf /var/www/html/*

# # Copy custom NGINX configuration
COPY conf/default /etc/nginx/sites-available/default

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=iecharak.42.fr/UID=login"

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# Expose port 443 for HTTPS
EXPOSE 443
#EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

