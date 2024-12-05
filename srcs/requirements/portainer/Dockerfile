from debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
	tar \
	curl

RUN if [ ! -f /usr/local/portainer/portainer ]; then \
	curl -sSL https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz | tar -xzo -C /usr/local; \
	fi

ENTRYPOINT ["/usr/local/portainer/portainer"]