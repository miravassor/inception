if [[ -f /database.sql ]]; then
  envsubst < /database.sql > /database_new.sql
  mysqld --user=root --bootstrap < /database_new.sql
  rm -f /database_new.sql && rm -f /database.sql
fi
mysqld --user=mysql