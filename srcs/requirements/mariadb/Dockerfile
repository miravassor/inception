FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY conf/mariadb.sh /mariadb.sh

RUN  chmod +x /mariadb.sh

ENTRYPOINT ["bash", "mariadb.sh"]

EXPOSE 3306