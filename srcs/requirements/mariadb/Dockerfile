FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./conf/init_script.sh /

RUN chmod +x /init_script.sh

ENTRYPOINT ["./init_script.sh"]
