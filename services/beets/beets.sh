#!/bin/bash

# Copy config 
cp /mnt/efesto-config/beets-config.yaml ${BEETSDIR}/config.yaml

exec /usr/local/bin/beet version &
exec /usr/local/bin/beet web
