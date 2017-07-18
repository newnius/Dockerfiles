FROM alpine:3.6

MAINTAINER Newnius <docker@newnius.com>

RUN apk add --no-cache  openssh

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ADD bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
