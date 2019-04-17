#!/bin/bash

# reset root password

if [[ -z "${SSH_PASS}" ]]; then
	export SSH_PASS=password
fi

echo "${SSH_PASS}" | passwd --stdin

# start sshd service
/etc/init.d/ssh start

# do nothing but wait
sleep infinity
