FROM ubuntu:18.04

MAINTAINER Newnius <docker@newnius.com>

RUN yes | unminimize && \
	apt update && \
	apt install -y curl openssh-server vim openjdk-8-jre python3-pip git bash-completion && \
	pip3 install numpy scipy pandas scikit-learn matplotlib sklearn && \
	rm -rf /var/lib/apt/lists/*

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

WORKDIR /root

ADD bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
