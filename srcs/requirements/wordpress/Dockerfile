FROM debian:bullseye

# Update and install packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y iputils-ping && \
    apt-get install -y php-fpm php-mysql php-gd php-curl php-xml && \
    apt-get install -y curl && \
    mkdir -p /var/www/html

# Copy the initialization script
COPY ./conf/init_script.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Make the script executable
RUN chmod +x /init_script.sh

# Set the entry point
ENTRYPOINT ["/init_script.sh"]