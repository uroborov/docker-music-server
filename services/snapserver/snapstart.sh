#!/bin/bash


# Copy config from nas config share
# cp /mnt/nfs-data/snapserver/librespot/target/release/librespot /usr/local/bin/librespot
# chown root:root /usr/local/bin/librespot
# chmod 755 /usr/localbin/librespot

cp /mnt/nfs-config/snapserver.conf /etc/snapserver.conf

exec /usr/bin/snapserver 