FROM ubuntu:18.04

WORKDIR app/
COPY . .

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y curl
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o app/docker-compose
RUN chmod +x app/docker-compose

EXPOSE 3000
ENTRYPOINT app/docker-compose up
