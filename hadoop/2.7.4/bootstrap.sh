#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

## replace config
: ${EXTRA_CONF_DIR:=/config/hadoop}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* $HADOOP_PREFIX/etc/hadoop/
fi

/usr/sbin/sshd

while true; do sleep 1000; done
