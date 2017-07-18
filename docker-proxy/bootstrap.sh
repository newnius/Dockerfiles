#! /bin/sh

# from https://github.com/danielguerra69/alpine-sshd
if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
	# generate fresh rsa key
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
	# generate fresh dsa key
	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi


/usr/sbin/sshd

ssh -t -t -D 0.0.0.0:7001 -o StrictHostKeyChecking=no localhost
