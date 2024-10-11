FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y iputils-ping && \
    apt-get install -y php-fpm php-mysql php-gd php-curl php-xml && \
    apt-get install -y curl && \
    mkdir -p /var/www/html

COPY ./conf/init_script.sh /

RUN chmod +x /init_script.sh

ENTRYPOINT ["./init_script.sh"]