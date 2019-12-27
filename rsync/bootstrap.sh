#!/bin/sh

if ! [[ -z "${AUTH_PASSWORD}" ]]; then
	echo "$AUTH_PASSWORD" > /etc/rsyncd.secret
	if ! [[ -z "${AUTH_USER}" ]]; then
		echo "$AUTH_USER:$AUTH_PASSWORD" > /etc/rsyncd.secrets
		chmod 600 /etc/rsyncd.secrets
	fi
fi

if [ -d /config/ ]; then
	cp /config/rsync* /etc/
fi

if ! [[ -z $@ ]]; then
	# use eval because commands likes `key=value command` would cause file not found error when using $@, but this eval will ruin current environment
	eval $@
else
	rsync --daemon --config=/etc/rsyncd.conf
	while pgrep rsync > /dev/null; do sleep 1; done
fi
