FROM debian:bullseye

RUN apt update && \
    apt-get upgrade -y && \
    apt install mariadb-server -y

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

COPY ./conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY ./conf/init_script.sh /

RUN chmod +x /init_script.sh

CMD ["./init_script.sh"]
