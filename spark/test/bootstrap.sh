#! /bin/bash

## replace config
: ${EXTRA_CONF_DIR:=/config/hadoop}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* /usr/local/hadoop/etc/hadoop/
fi

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
