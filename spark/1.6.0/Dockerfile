FROM sequenceiq/spark:1.6.0

MAINTAINER Newnius <newnius.cn@gmail.com>

ADD bootstrap.sh /etc/bootstrap.sh

COPY config/hadoop /mnt/config/hadoop
COPY config/spark  /mnt/config/spark
COPY config/spark-yarn-remote-client /mnt/config/spark-yarn-remote-client

WORKDIR /usr/local/hadoop

ENTRYPOINT ["/etc/bootstrap.sh"]
