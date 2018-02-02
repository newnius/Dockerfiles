#! /bin/sh

echo "forward-socks5   /               $1 ." >> /etc/privoxy/config

privoxy --no-deamon /etc/privoxy/config
