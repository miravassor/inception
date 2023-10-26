#!/bin/sh
service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'localhost' IDENTIFIED BY '${MDB_PASSWORD}';"
mysql -e "GRANT ALL ON \`${MDB_DATABASE}\`.* TO \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MDB_ROOT_PASSWORD shutdown
exec mysqld_safe