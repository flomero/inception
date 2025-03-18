FROM debian:bullseye

RUN apt-get update && apt-get install -y nodejs npm

COPY src . 
RUN npm install

ENTRYPOINT [ "node", "server.js" ]