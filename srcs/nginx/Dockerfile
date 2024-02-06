# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.13

# Install NGINX and other necessary packages
RUN apk --update --no-cache add nginx

# Copy NGINX configuration file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Expose port 443
EXPOSE 443

# CMD to start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
