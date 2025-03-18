FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	redis

COPY tools/setup.sh .
RUN chmod +x setup.sh

EXPOSE 6379

ENTRYPOINT ["./setup.sh"]