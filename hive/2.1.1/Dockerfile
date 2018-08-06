FROM alpine:3.8

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Install Apche Hive
ENV HIVE_VER 2.1.1

RUN wget -O apache-hive.tar.gz https://archive.apache.org/dist/hive/hive-$HIVE_VER/apache-hive-$HIVE_VER-bin.tar.gz && \
tar -xzf apache-hive.tar.gz -C /usr/local/ && rm apache-hive.tar.gz

RUN ln -s /usr/local/apache-hive-$HUVE_VER-bin /usr/local/hive

ENV HIVE_HOME /usr/local/hive

ENV PATH $PATH:$HIVE_HOME/bin

ADD mysql-connector-java-5.1.44-bin.jar $HIVE_HOME/lib

ADD hive-site.xml $HIVE_HOME/conf

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR $HIVE_HOME

CMD ["/etc/bootstrap.sh", "-d"]
