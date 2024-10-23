FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	mariadb-server

COPY tools/init.sql /etc/mysql/init.sql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /run/mysqld

COPY tools/start.sh start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]