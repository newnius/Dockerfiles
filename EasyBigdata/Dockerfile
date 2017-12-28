FROM ubuntu:16.04
MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

RUN apt-get update -y && \
		apt-get install -y \
			make \
			python3 \
			python3-dev \
			gcc \
			g++ \
			libsasl2-dev \
			libmysqlclient-dev

WORKDIR /var/www/html

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
