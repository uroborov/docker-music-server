FROM rust:1.57-slim-buster AS librespot

RUN apt-get update \
 && apt-get -y install build-essential portaudio19-dev curl unzip \
 && apt-get clean && rm -fR /var/lib/apt/lists

ARG ARCH=amd64
ARG LIBRESPOT_VERSION=0.3.1

COPY ./install-librespot.sh /tmp/
RUN /tmp/install-librespot.sh


FROM debian:buster-slim

ARG  snapcast_version=0.25.0
ARG TARGETARCH=amd64

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapserver_${snapcast_version}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g').deb
RUN  dpkg -i snapserver_${snapcast_version}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g').deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*

COPY --from=librespot /usr/local/cargo/bin/librespot /usr/local/bin/

RUN /usr/bin/snapserver -v

EXPOSE 1704 1705 1780

COPY snapstart.sh /usr/local/bin/snapstart.sh
RUN chmod +x /usr/local/bin/snapstart.sh

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/snapstart.sh"]
