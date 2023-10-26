FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget && \
    php8.2 && \
    php-fpm && \
    php-mysql && \
    mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf latest-fr_FR.tar.gz && \
    rm latest-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY conf/wordpress.sh wordpress.sh

RUN  chmod +x /wordpress.sh

ENTRYPOINT ["bash", "wordpress.sh"]

