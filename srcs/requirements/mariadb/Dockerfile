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
# FROM debian:buster

# RUN apt-get update
# RUN apt-get install -y mariadb-server \
#     mariadb-client \
#     vim \
#     && rm -rf /var/lib/apt/lists/*

# #Allow to run the daemon of mysql
# # Purge and re-create /var/lib/mysql with appropriate ownership
# # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
# RUN mkdir -p /var/run/mysqld \
# && chown -R mysql:mysql /var/run/mysqld \
# && chmod 777 /var/run/mysqld

# EXPOSE 3306

# #COPY		./conf/mysqld.conf ~/my.cnf
# #COPY		./conf/mysqld.conf /etc/mysql/my.cnf
# #COPY		./conf/mysqld.conf /etc/my.cnf


# #Copy of the .sh and .sql in the /bin of the container to be able to run the program
# # Give the right to execute + launch the .sh
# COPY ./tools/mariadb.sh /usr/local/bin/
# #COPY ./conf/wordpress.sql /usr/local/bin/
# RUN chmod +x /usr/local/bin/mariadb.sh
# #RUN chmod +x /usr/local/bin/wordpress.sql

# ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

# #Command to launch mariadb and enable the database to listen globally - also can be put on mysqldump.cnf file
# CMD ["mysqld", "--bind-address=0.0.0.0"]

##########################################################################################

# # Use Debian as the base image
# FROM debian:buster-slim

# # Install MariaDB
# RUN apt-get update && apt-get install -y mariadb-server

# # Copy custom configuration files (if any)
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# # Expose MariaDB port
# EXPOSE 3306

# # Set up entrypoint script
# COPY ./tools/entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

##########################################################################################

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


