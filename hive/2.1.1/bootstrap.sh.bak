#!/bin/bash

# setup hadoop
bash /etc/start_hadoop.sh -bash

hive --service metastore

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
