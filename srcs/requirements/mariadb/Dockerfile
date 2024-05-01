# Use Debian as the base image
FROM debian:buster-slim

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Copy custom configuration files (if any)
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose MariaDB port
#EXPOSE 3306

# Set up entrypoint script
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# # Use Debian 10 (Buster) as the base image
# FROM debian:buster-slim

# # Install MariaDB server
# RUN apt-get update && \
#     apt-get install -y mariadb-server && \
#     rm -rf /var/lib/apt/lists/*

# # Copy custom MariaDB configuration
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# # Set environment variables for database configuration
# ENV SQL_DATABASE=mydatabase
# ENV SQL_USER=myuser
# ENV SQL_PASSWORD=mypassword
# ENV SQL_ROOT_PASSWORD=rootpassword

# # Copy initialization script
# COPY tools/init_db.sh /usr/local/bin/init_db.sh

# # Grant execution permissions to the script
# RUN chmod +x /usr/local/bin/init_db.sh

# # Expose port 3306 for MySQL/MariaDB
# EXPOSE 3306

# # Start MariaDB server and execute initialization script
# CMD ["init_db.sh"]


