#!/bin/sh

if ! [ "$(ls -A /var/lib/transmission/config/)" ]; then
  cp /config/* /var/lib/transmission/config/

fi

/usr/bin/transmission-daemon --foreground --no-portmap --log-error --config-dir /var/lib/transmission/config
