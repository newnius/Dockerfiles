FROM alpine:3.7

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

RUN apk update && \
    apk add \
			python3 \
			python3-dev \
			bash \
			make \
			gcc \
			g++ \
			musl-dev \
			mariadb-dev \
			cyrus-sasl \
			cyrus-sasl-dev \
			nginx \
			linux-headers

RUN ln -s /usr/include/python3.6m /usr/include/python3.6

RUN ln -s /usr/bin/python3.6 /usr/bin/python

WORKDIR /var/www/html

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
