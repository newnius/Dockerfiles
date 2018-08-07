#! /bin/bash

if [[ $1 == "master" ]]; then
	/usr/local/spark/sbin/start_master.sh
fi

if [[ $1 == "slave" ]]; then
	/usr/local/spark/sbin/start_slave.sh $2
fi

while true; do sleep 1000; done
