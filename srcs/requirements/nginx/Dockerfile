FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -nodes \
    -out    /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj   "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=avassor.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]