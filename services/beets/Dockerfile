FROM debian:buster-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg && \
    rm -rf /var/lib/apt/lists/*


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    vim \
    sudo \
    build-essential \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools

RUN pip3 install https://github.com/sumpfralle/beets/tarball/patch-1
RUN pip3 install requests \
    requests_oauthlib\
    flask \
    flask-cors \
    python3-discogs-client \
    beetcamp \
    https://github.com/igordertigor/beets-usertag/tarball/master

ENV BEETSDIR="/beets"
RUN mkdir $BEETSDIR
COPY beets.sh /usr/local/bin/beets.sh

EXPOSE 8337

ENTRYPOINT ["/usr/local/bin/beets.sh"]