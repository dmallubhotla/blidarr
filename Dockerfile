ARG LIDARR_VERSION=version-0.8.1.2135
FROM linuxserver/lidarr:${LIDARR_VERSION}

LABEL maintainer="Deepak <dmallubhotla+github@gmail.com>" \
	org.opencontainers.image.source="https://github.com/dmallubhotla/blidarr"

RUN apt-get update &&\
 apt-get install -y software-properties-common &&\
 add-apt-repository universe
RUN ["apt-get", "install", "-y", "python3", "python3-pip"]

COPY requirements.txt /opt/beets_req/requirements.txt

RUN ["pip3", "install", "-r", "/opt/beets_req/requirements.txt"]
RUN ["beet", "--version"]

ENV BEETSDIR="/beetconfig"
VOLUME /beetconfig
