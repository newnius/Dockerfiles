# based on sequenceiq/spark

## Create a spark cluster in swarm mode

`--hostname` needs 1.13 or higher

```bash
docker service create \
--name spark-master \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark
```

```bash
docker service create \
--name spark-slave1 \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark
```

```bash
docker service create \
--name spark-slave2 \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark
```

## Init && Test

In the first deploy, format dfs first

### stop cluster (in master)
`sbin/stop-yarn.sh`
`sbin/stop-dfs.sh`
`../spark/sbin/stop-all.sh`

### remove previous data (in all nodes)
clear all data in /tmp in all nodes

### format hdfs (in master)
```
bin/hadoop namenode -format
```

### start cluster (in master)
`sbin/start-dfs.sh`
`sbin/start-yarn.sh`
`../spark/sbin/start-all.sh`

### monitor cluster in browser

YARN:  spark-master:8088

HDFS:  spark-master:50070

SPARK: spark-master:8080

_Proxy needed, e.g. newnius/docker-proxy_

## customized config

```bash
docker service create \
--name spark-master \
--network swarm-net \
--replicas 1 \
--mount type=bind,source=/mnt/data/spark/hdfs/master,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/spark/logs/master,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/spark/config/hadoop,target=/mnt/config/hadoop \
--mount type=bind,source=/mnt/data/spark/config/spark,target=/mnt/config/spark \
--mount type=bind,source=/mnt/data/spark/config/spark-yarn-remote-client,target=/mnt/config/spark-yarn-remote-client \
--endpoint-mode dnsrr \
newnius/spark
```

You dont't need to put all files in dir, only add files needs modified.
