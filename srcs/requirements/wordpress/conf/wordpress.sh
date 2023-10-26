#!/bin/sh

sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ];
then
    wp config create	--allow-root --dbname=$MDB_DATABASE --dbuser=$MDB_USER --dbpass=$MDB_PASSWORD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 10
wp core install     --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADM_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $WP_U1_LOGIN $WP_U1_EMAIL --user_pass=$WP_U1_PASS --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F