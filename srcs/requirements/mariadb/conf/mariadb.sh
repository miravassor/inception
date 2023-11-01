#!/bin/sh
echo "Mariadb install"
echo
echo "Copy environnement"
envsubst < /database.sql > /database_new.sql
mysqld --user=root --bootstrap < database_new.sql
rm -f database_new.sql && rm -f database.sql
echo "Execute mariadb"
mysqld_safe --user=root $@