FROM sequenceiq/hadoop-docker:2.7.1

MAINTAINER Newnius <newnius.cn@gmail.com>

ADD bootstrap.sh /etc/bootstrap.sh

RUN mkdir -p /mnt/hadoop-config

ADD core-site.xml   /mnt/hadoop-config
ADD yarn-site.xml   /mnt/hadoop-config
ADD mapred-site.xml /mnt/hadoop-config
ADD hdfs-site.xml   /mnt/hadoop-config
ADD slaves          /mnt/hadoop-config

WORKDIR /usr/local/hadoop

CMD ["/etc/bootstrap.sh", "-d"]
