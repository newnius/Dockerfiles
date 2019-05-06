FROM ubuntu:18.04

MAINTAINER Newnius <newnius.cn@gmail.com>

# Prerequisites
RUN apt update && \
	apt install -y lm-sensors zabbix-agent && \
	rm -rf /var/lib/apt/lists/*

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
