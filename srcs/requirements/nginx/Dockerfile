FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y


RUN mkdir -p /etc/nginx/ssl /var/www /run/nginx 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/privatekey.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=timartin"

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]