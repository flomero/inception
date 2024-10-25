FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	curl \
	php \
	php-mysql

RUN mkdir -p /var/www/html

RUN curl -L -o /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN chmod 644 var/www/html/index.php

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]

