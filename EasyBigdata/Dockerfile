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
			cyrus-sasl-dev

RUN ln -s /usr/include/python3.6m /usr/include/python3.6

WORKDIR /var/www/html

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
