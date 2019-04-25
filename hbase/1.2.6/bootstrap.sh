#!/bin/bash

# set region server hostname
sed -i "s/HOSTNAME/$(hostname)/" /usr/local/hbase/conf/hbase-site.xml 

## replace config
: ${EXTRA_CONF_DIR:=/config/hbase}

if [ -d "$EXTRA_CONF_DIR" ]; then
	cp $EXTRA_CONF_DIR/* $HBASE_HOME/conf/
fi

/usr/sbin/sshd

while true; do sleep 1000; done
