FROM alpine:3.7

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk add --no-cache privoxy

RUN sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config

ADD bootstrap.sh /etc/bootstrap.sh

ENTRYPOINT ["/etc/bootstrap.sh"]
