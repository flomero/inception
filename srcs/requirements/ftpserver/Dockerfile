FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	vsftpd \
	net-tools \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /app/setup.sh
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

CMD ["bash", "/app/setup.sh"]