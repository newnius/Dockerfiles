FROM alpine:3.8

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Prerequisites
RUN apk add --no-cache aria2

RUN mkdir -p /etc/aria2/

ADD aria2.conf /etc/aria2/aria2.conf

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /

CMD ["/etc/bootstrap.sh"]
