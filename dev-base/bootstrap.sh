#!/bin/bash

# reset root password

if [[ -z "${SSH_PASS}" ]]; then
	export SSH_PASS=password
fi

echo -e "${SSH_PASS}\n${SSH_PASS}" | passwd

# start sshd service
/etc/init.d/ssh start

# do nothing but wait
sleep infinity
