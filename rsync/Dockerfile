FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk add --no-cache rsync

RUN ln -s /var/log/rsyncd.log /dev/stdout

ADD bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
