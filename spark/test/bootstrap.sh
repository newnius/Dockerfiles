#! /bin/bash

if [[ $1 == "master" ]]; then
	./sbin/start_master.sh
fi

if [[ $1 == "slave" ]]; then
	./sbin/start_slave.sh spark://$2:7077
fi

while true; do sleep 1000; done
