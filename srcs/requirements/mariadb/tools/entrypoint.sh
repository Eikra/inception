#!/bin/bash
set -e

# Perform any pre-startup tasks here if needed

# Start MariaDB service
exec /usr/bin/mysqld_safe --skip-syslog --datadir="/var/lib/mysql"
