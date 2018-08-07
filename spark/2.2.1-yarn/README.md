# Spark on yarn

## Create a spark cluster in swarm mode

`--hostname` needs 1.13 or higher

```bash
docker service create \
--name spark-master \
--hostname spark-master \
--detach true \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark:2.2.1
```

```bash
docker service create \
--name spark-slave1 \
--hostname spark-slave1 \
--detach true \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark:2.2.1
```

```bash
docker service create \
--name spark-slave2 \
--hostname spark-slave2 \
--detach true \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/spark:2.2.1
```

## Init && Test

In the first deploy, format hdfs

### Stop HDFS (in master)
```bash
sbin/stop-dfs.sh
```

### Format HDFS (in master)
```
bin/hadoop namenode -format
```

### Start HDFS (in master)
```bash
sbin/start-dfs.sh
```

### Run Hello World
```bash
spark-submit \
	--master yarn \
	--deploy-mode cluster \
	--class org.apache.spark.examples.JavaSparkPi \
	./examples/jars/spark-examples_2.11-2.2.1.jar 100
```

### UI

YARN: spark-master:8088

HDFS: spark-master:50070

_Proxy needed, e.g. [newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/)_

## customized config

```bash
docker service create \
--name spark-master \
--hostname spark-master \
--detach=true \
--network swarm-net \
--replicas 1 \
--mount type=bind,source=/mnt/data/spark/hdfs/master,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/spark/logs/master,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/spark/config/hadoop,target=/mnt/config/hadoop \
--mount type=bind,source=/mnt/data/spark/config/spark,target=/mnt/config/spark \
--endpoint-mode dnsrr \
newnius/spark:2.2.1
```

You dont't need to put all files in dir, only add files to be replaced.
