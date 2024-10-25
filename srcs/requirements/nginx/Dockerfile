FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	nginx \
	openssl \
	gettext-base

COPY conf/nginx.conf /etc/nginx/sites-available/default

COPY tools/start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]