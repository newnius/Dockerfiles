FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk add --no-cache rsync

ADD bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
