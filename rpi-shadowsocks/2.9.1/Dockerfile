FROM hypriot/rpi-alpine-scratch:v3.4

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk update && \
  apk add python openssl && \
  rm -rf /var/cache/apk/*

RUN wget -O shadowsocks.tar.gz https://github.com/shadowsocks/shadowsocks/archive/2.9.1.tar.gz && \
  tar -xzf shadowsocks.tar.gz && \
  rm shadowsocks.tar.gz && \
  ln -s /shadowsocks-2.9.1 /shadowsocks

RUN echo '#!/bin/sh' > /usr/bin/ssserver && \
    echo 'python /shadowsocks/shadowsocks/server.py "$@"' >> /usr/bin/ssserver && \
    echo '#!/bin/sh' > /usr/bin/sslocal && \
    echo 'python /shadowsocks/shadowsocks/local.py "$@"' >> /usr/bin/sslocal && \
    chmod +x /usr/bin/ssserver && \
    chmod +x /usr/bin/sslocal
