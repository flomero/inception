from debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	tar \
	curl

RUN curl -sSL https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz | tar -xzo -C /usr/local

ENTRYPOINT ["/usr/local/portainer/portainer"]