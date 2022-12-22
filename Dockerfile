FROM ubuntu:18.04

WORKDIR app/

RUN apt-get update
RUN apt-get upgrade -qy

RUN apt-get install -qy python3
RUN apt-get install -qy python3-pip
RUN apt-get install -qy curl
RUN curl -L "https://github.com/docker/compose/releases/download/v2.14.2/docker-compose-linux-x86_64" -o docker-compose
RUN chmod +x docker-compose

RUN curl -sSL https://get.docker.com/ | sh
RUN export DOCKER_HOST=tcp://localhost:2375

COPY docker-compose.yml .
ENTRYPOINT service --status-all && service docker start && service docker start && dockerd &&  ./docker-compose -f ./docker-compose.yml up

EXPOSE 3000
