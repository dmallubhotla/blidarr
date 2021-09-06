ARG LIDARR_VERSION=version-0.8.1.2135
FROM linuxserver/lidarr:${LIDARR_VERSION}

RUN apt-get update &&\
 apt-get install -y software-properties-common &&\
 add-apt-repository universe
RUN ["apt-get", "install", "-y", "python3", "python3-pip"]
RUN ["pip3", "install", "beets"]
RUN ["beet", "--version"]
