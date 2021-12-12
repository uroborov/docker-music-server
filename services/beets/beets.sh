#!/bin/bash

# Copy config 
cp /mnt/nfs-config/beets-config.yaml ${BEETSDIR}/config.yaml

exec /usr/local/bin/beet version &
exec /usr/local/bin/beet web
