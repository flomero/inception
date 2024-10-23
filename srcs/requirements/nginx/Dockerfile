FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	nginx \
	openssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -subj "/C=DE/ST=BW/O=42HN/CN=$DOMAIN_NAME"

CMD ["nginx", "-g", "daemon off;"]