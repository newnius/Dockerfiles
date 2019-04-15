#!/bin/bash

: ${EXTRA_CONF_DIR:=/config/kafka}

## Overide default configuration files
if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* /usr/local/kafka/config
fi


if ! [[ -z "${BROKER_ID}" ]]; then
	sed -i '/broker.id=/d' /usr/local/kafka/config/server.properties
	echo "broker.id=$BROKER_ID" >> /usr/local/kafka/config/server.properties
fi

if ! [[ -z "${ZOOKEEPER_CONNECT}" ]]; then
	sed -i '/zookeeper.connect=/d' /usr/local/kafka/config/server.properties
	echo "zookeeper.connect=$ZOOKEEPER_CONNECT" >> /usr/local/kafka/config/server.properties
fi

bash /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
