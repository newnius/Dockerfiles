#!/bin/bash

if ! [[ -z "${RPC_SECRET}" ]]; then
	sed -i '/rpc-secret=/d' /etc/aria2/aria2.conf
	echo -e "\nrpc_secret==$RPC_SECRET" >> /etc/aria2/aria2.conf
fi

aria2c --conf-path=/etc/aria2/aria2.conf
