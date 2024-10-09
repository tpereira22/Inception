FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        iputils-ping \
        curl \
        wget \
        unzip \
        php7.4 \
        php7.4-fpm \
        php7.4-mysql \
        php7.4-gd \
        php7.4-curl \
        php7.4-xml \
        php7.4-mbstring && \
    mkdir -p /var/www/html && \
    mkdir -p /run/php


COPY ./conf/init_script.sh /

RUN chmod +x /init_script.sh

EXPOSE 9000

ENTRYPOINT ["./init_script.sh"]