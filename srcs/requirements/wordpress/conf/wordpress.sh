#!/bin/bash

chown -R www-data:www-data /var/www/html/*
chmod -R 755 /var/www/html/*

mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/wordpress
wp core install \
    --allow-root \
    --url=${URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_ADMIN} \
    --admin_password=${WP_ADM_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --path=/var/www/html/wordpress
wp user create ${WP_U1_LOGIN} ${WP_U1_EMAIL} \
                --allow-root \
                --user_pass=${WP_U1_PASS} \
                --path=/var/www/html/wordpress

exec "$@"