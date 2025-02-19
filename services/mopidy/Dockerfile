FROM debian:buster-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    tzdata \
    sudo \
    build-essential \
    python3-dev \
    python3-pip \
    python3-gst-1.0 \
    python3-wheel \
    gir1.2-gstreamer-1.0 \
    gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    libspotify12 \
    libspotify-dev \
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libz-dev \
    python3-setuptools \
    python3-spotify && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    Mopidy \
    Mopidy-MPD \
    Mopidy-Local \
    Mopidy-Spotify \
    Mopidy-Beets \
    Mopidy-Youtube \
    Mopidy-YTMusic \
    Mopidy-Iris

RUN mkdir -p /mopidy
RUN touch /IS_CONTAINER
RUN useradd -ms /bin/bash mopidy
RUN sh -c 'echo "mopidy ALL=NOPASSWD: /usr/local/lib/python3.7/dist-packages/mopidy_iris/system.sh, /usr/bin/apt*" >> /etc/sudoers'
RUN sed -i 's+--config .*mopidy.conf+--config /mopidy/mopidy.conf+g' /usr/local/lib/python3.7/dist-packages/mopidy_iris/system.sh
RUN chown -R mopidy:mopidy /mopidy

# COPY mopidy.conf /mopidy_default.conf
COPY mopidy.sh /usr/local/bin/mopidy.sh


EXPOSE 6600 6680
USER root
ENTRYPOINT ["/usr/local/bin/mopidy.sh"]
