FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

RUN apk add --no-cache transmission-daemon

# Default Conf Files
ADD config/ /config/

WORKDIR /root

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
