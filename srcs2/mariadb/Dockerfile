# Use the penultimate stable version of Alpine as the base image
FROM alpine:3.13

# Install MariaDB
RUN apk --update --no-cache add mariadb

# Copy MariaDB configuration file
COPY ./conf/my.cnf /etc/my.cnf

# CMD to start MariaDB in the foreground
CMD ["mysqld", "--console"]
