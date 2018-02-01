FROM newnius/hadoop:2.8.1

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN wget http://mirrors.ocf.berkeley.edu/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz && \
	tar -xvf spark-2.2.1-bin-hadoop2.7.tgz -C /usr/local && \
	rm spark-2.2.1-bin-hadoop2.7.tgz

RUN ln -s /usr/local/spark-2.2.1 /usr/local/spark

ENV SPARK_HOME /usr/local/spark

ENV PATH $PATH:$SPARK_HOME/bin

# Default Conf Files
ADD core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
ADD mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
ADD yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
ADD slaves $HADOOP_HOME/etc/hadoop/slaves

ADD bootstrap.sh /etc/bootstrap-spark.sh

WORKDIR /usr/local/spark

CMD ["/etc/bootstrap-spark.sh", "-d"]
