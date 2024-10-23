FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY init.sql /etc/mysql/init.sql
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /run/mysqld

CMD ["mysqld"]