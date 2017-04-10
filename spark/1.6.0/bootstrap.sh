#! /bin/bash


: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

cp -a /mnt/config/hadoop/. /usr/local/hadoop/etc/hadoop/
cp -a /mnt/config/spark/. /usr/local/spark/conf/
cp -a /mnt/config/spark-yarn-remote-client/. /usr/local/spark/yarn-remote-client/

service sshd start

## stop all in case master starts far behind
$HADOOP_PREFIX/sbin/stop-yarn.sh
$HADOOP_PREFIX/sbin/stop-dfs.sh

$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver


$SPARK_HOME/sbin/start-all.sh


if [[ $1 == "-bash" ]]; then
  /bin/bash
else
  while true; do sleep 1000; done
fi
