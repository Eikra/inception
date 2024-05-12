#!/bin/bash

# Create directory for SSL certificates
mkdir -p $CERT_DIR

# Replace the placeholders in the NGINX config
sed -i "s|CERT_HERE|$CERT_|g" /etc/nginx/sites-available/default
sed -i "s|CERT_KEY_HERE|$CERT_KEY|g" /etc/nginx/sites-available/default

# Generate self-signed SSL certificate
openssl req -x509 -nodes -out $CERT_ -keyout $CERT_KEY -subj $SUBJ

sleep 5
# Start NGINX in the foreground
nginx -g "daemon off;"
