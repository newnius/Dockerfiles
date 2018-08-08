#! /bin/bash

## replace config
: ${EXTRA_CONF_DIR:=/config/hadoop}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* /usr/local/hadoop/etc/hadoop/
fi

while true; do sleep 1000; done
