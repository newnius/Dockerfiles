FROM alpine:3.8

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Prerequisites
RUN apk add --no-cache openssh openssl openjdk8-jre rsync bash procps coreutils

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

ENV PATH $PATH:$JAVA_HOME/bin

ENV SPARK_VER 2.3.1

RUN wget https://archive.apache.org/dist/spark/spark-$SPARK_VER/spark-$SPARK_VER-bin-hadoop2.7.tgz && \
	tar -xvf spark-$SPARK_VER-bin-hadoop2.7.tgz -C /usr/local && \
	rm spark-$SPARK_VER-bin-hadoop2.7.tgz

RUN ln -s /usr/local/spark-$SPARK_VER-bin-hadoop2.7 /usr/local/spark

ENV SPARK_HOME /usr/local/spark

ENV PATH $PATH:$SPARK_HOME/bin

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /usr/local/spark

ENTRYPOINT ["/etc/bootstrap.sh"]
