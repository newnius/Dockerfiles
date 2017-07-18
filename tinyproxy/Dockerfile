FROM alpine:latest

MAINTAINER Newnius <docker@newnius.com>

ADD bootstrap.sh /etc/bootstrap.sh

RUN apk add --no-cache tinyproxy

ENTRYPOINT ["/etc/bootstrap.sh"]
