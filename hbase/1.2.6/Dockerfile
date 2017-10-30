FROM newnius/hadoop:2.7.4

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Install Apche HBase
RUN wget -O apache-hbase.tar.gz http://mirrors.ocf.berkeley.edu/apache/hbase/1.2.6/hbase-1.2.6-bin.tar.gz && \
tar xzvf apache-hbase.tar.gz -C /usr/local/ && rm apache-hbase.tar.gz

# Create a soft link to make future upgrade transparent
RUN ln -s /usr/local/hbase-1.2.6 /usr/local/hbase

ENV HBASE_HOME /usr/local/hbase
ENV PATH $PATH:$HBASE_HOME/bin

# Add default conf files of 1 master, 2 back server, 3 engionserver
ADD hbase-site.xml $HBASE_HOME/conf
ADD hbase-env.sh $HBASE_HOME/conf
ADD regionservers $HBASE_HOME/conf
ADD backup-masters $HBASE_HOME/conf

WORKDIR /usr/local/hbase

CMD ["/etc/bootstrap.sh", "-d"]
