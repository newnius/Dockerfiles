#!/bin/bash

## Overide default configuration files
: ${EXTRA_CONF_DIR:=/config/kafka}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* /usr/local/kafka/config
fi

bash /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
