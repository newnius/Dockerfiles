FROM ubuntu:18.04

MAINTAINER Newnius <docker@newnius.com>

RUN apt update && \
	apt install -y curl wget iproute2 openssh-server vim openjdk-8-jre python3-pip git bash-completion sudo && \
	pip3 install numpy scipy pandas scikit-learn matplotlib

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

WORKDIR /root
