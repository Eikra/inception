# Use the latest Debian slim image
FROM debian:bullseye-slim

# Install PHP and other dependencies
RUN apt-get update \
    && apt-get install -y php7.4-fpm \
    # Add any other dependencies if needed \
    && rm -rf /var/lib/apt/lists/*

# ... (any other necessary configurations)

# CMD to start php-fpm in the foreground
CMD ["php-fpm7.4", "-F"]
