FROM openjdk:8-jre-alpine

MAINTAINER Newnius <newnius.cn@gmail.com>

# Prerequisites
RUN apk add --no-cache bash

# Install Kafka
RUN wget -O kafka.tgz https://archive.apache.org/dist/kafka/2.1.1/kafka_2.12-2.1.1.tgz && \
	tar -xzf kafka.tgz -C /usr/local/ && rm kafka.tgz

RUN ln -s /usr/local/kafka_2.12-2.1.1 /usr/local/kafka

ENV KAFKA_HOME /usr/local/kafka

WORKDIR $KAFKA_HOME

ADD start_kafka.sh /etc/start_kafka.sh

CMD ["/etc/start_kafka.sh"]
