FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client gettext && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rdf /etc/mysql/my.cnf

ENV LANG C.UTF-8

COPY conf/my.cnf etc/mysql/my.cnf
COPY conf/mariadb.sh /mariadb.sh
COPY conf/database.sql /database.sql

RUN mkdir /var/run/mysqld/ && \
    chmod 777 /var/run/mysqld  && \
    chmod a+x /mariadb.sh

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["bash", "mariadb.sh"]