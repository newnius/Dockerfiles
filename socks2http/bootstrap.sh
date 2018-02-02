#! /bin/sh

echo "forward-socks5   /               $1 ." >> /etc/privoxy/config

privoxy --no-daemon /etc/privoxy/config
