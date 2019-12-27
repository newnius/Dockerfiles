FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk add --no-cache rsync

RUN ln -s /dev/stdout /var/log/rsyncd.log

ADD bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
