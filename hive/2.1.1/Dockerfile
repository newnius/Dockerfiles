FROM newnius/hadoop:2.7.4

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Install Apche Hive
RUN wget -O apache-hive.tar.gz http://www-eu.apache.org/dist/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz && \
tar -xzf apache-hive.tar.gz -C /usr/local/ && rm apache-hive.tar.gz

RUN ln -s /usr/local/apache-hive-2.1.1-bin /usr/local/hive

ENV HIVE_HOME /usr/local/apache-hive-2.1.1-bin
ENV PATH $PATH:$HIVE_HOME/bin

ADD mysql-connector-java-5.1.44-bin.jar $HIVE_HOME/lib
ADD hive-site.xml $HIVE_HOME/conf

RUN mv /etc/bootstrap.sh /etc/start_hadoop.sh

ADD bootstrap.sh /etc/bootstrap.sh
ADD init_hive.sh /etc/init_hive.sh

CMD ["/etc/bootstrap.sh", "-d"]
