#!/bin/bash

SERVER="localhost"
HOSTNAME=$(hostname)

if ! [[ -z "${ZBX_SERVER_HOST}" ]]; then
	SERVER=${ZBX_SERVER_HOST}
fi

if ! [[ -z "${ZBX_HOSTNAME}" ]]; then
	HOSTNAME=${ZBX_HOSTNAME}
fi

while true; do

  temp=$(sensors | awk '{print $3}' | grep '+' | sed -r 's/\+([0-9]*)\..*/\1/g' | sort | tail -n 1)

  zabbix_sender -s $HOSTNAME -z $SERVER -k "temp" -o $temp

sleep 30

done
