#!/bin/bash

## replace config
test -d /config/hadoop && cp /config/hadoop/* /usr/local/hadoop/etc/hadoop/
test -d /config/hive && cp /config/hive/* /usr/local/hive/conf/

hive --service metastore

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
