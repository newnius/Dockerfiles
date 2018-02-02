FROM python:3.7-rc-alpine

MAINTAINER Newnius <newnius.cn@gmail.com>

ADD shadowsocksr /usr/local/shadowsocksr

WORKDIR /usr/local/shadowsocksr/shadowsocks

RUN ln -s /usr/local/shadowsocksr/shadowsocks/server.py /usr/bin/ssrserver

RUN ln -s /usr/local/shadowsocksr/shadowsocks/local.py /usr/bin/ssrlocal
