ARG LIDARR_VERSION=version-0.8.1.2135
FROM linuxserver/lidarr:${LIDARR_VERSION}

LABEL maintainer="Deepak <dmallubhotla+github@gmail.com>" \
	org.opencontainers.image.source="https://github.com/dmallubhotla/blidarr"

RUN apt-get update &&\
 apt-get install -y --no-install-recommends software-properties-common gcc &&\
 add-apt-repository -y ppa:deadsnakes/ppa
RUN ["apt-get", "install", "-y", "--no-install-recommends", "python3.10", "python3.10-venv", "libpython3.10-dev", "libffi-dev"]

COPY requirements.txt /opt/beets_req/requirements.txt

RUN ["python3.10", "-m", "venv", "/venv"]
ENV PATH=/venv/bin:$PATH
RUN ["pip", "install", "-r", "/opt/beets_req/requirements.txt"]
RUN ["beet", "--version"]

ENV BEETSDIR="/beetconfig"
VOLUME /beetconfig
