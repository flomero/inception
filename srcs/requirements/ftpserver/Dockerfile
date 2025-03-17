FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	vsftpd \
	net-tools \
	rsyslog \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /app/setup.sh
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY conf/rsyslog.conf /etc/rsyslog.conf

RUN mkdir -p /var/run/vsftpd/empty

ENTRYPOINT ["bash", "/app/setup.sh"]