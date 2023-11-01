FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl bash php7.3 php-fpm php-mysql mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -P /var/www/html && \
#     cd /var/www/html && tar -xzf latest-fr_FR.tar.gz && \
#     rm latest-fr_FR.tar.gz

RUN wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www/html \
&& cd /var/www/html \
&& tar -xzf wordpress-6.1.1-fr_FR.tar.gz \
&& rm wordpress-6.1.1-fr_FR.tar.gz

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php
COPY conf/wordpress.sh wordpress.sh

RUN chmod a+x /wordpress.sh

EXPOSE 9000

ENTRYPOINT ["/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]