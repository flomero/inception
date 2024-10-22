FROM debian:bullseye

RUN apt update && \
	apt upgrade -y && \
	apt install -y php7.4-fpm

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

# needed to create the pid file
RUN mkdir /run/php

CMD ["php-fpm7.4", "-F"]