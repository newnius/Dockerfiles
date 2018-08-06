#!/bin/bash

## replace config
: ${EXTRA_CONF_DIR:=/config/hbase}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* $HBASE_HOME/conf/
fi

/usr/sbin/sshd

## stop all in case master starts far behind
# $HBASE_HOME/bin/stop-hbase.sh
$HBASE_HOME/bin/start-hbase.sh

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
