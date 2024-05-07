# Use Debian Buster slim as base image
FROM debian:buster-slim

# Copy the MySQL configuration file
COPY conf/my.cnf /etc/mysql/my.cnf

# Copy the setup script
COPY tools/setup_mariadb.sh /usr/local/bin/setup_mariadb.sh

# Grant execute permissions to the script
RUN chmod +x /usr/local/bin/setup_mariadb.sh

# Update package index and install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose MySQL port
EXPOSE 3306

# Set the entry point to the setup script
ENTRYPOINT ["/usr/local/bin/setup_mariadb.sh"]





