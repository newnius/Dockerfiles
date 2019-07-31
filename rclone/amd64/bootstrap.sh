#!/bin/bash

if [[ ! -f /root/sync.sh ]]; then
	cp /etc/sync.sh /root/sync.sh
fi

bash /root/sync.sh
