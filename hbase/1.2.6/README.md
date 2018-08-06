Run Aapache HBase with Docker

## Create a hadoop cluster with HBase installed in swarm mode

`--hostname` needs 1.13 or higher

```bash
docker service create \
--name hbase-master \
--network swarm-net \
--hostname hbase-master \
--replicas 1 \
--detach=true \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode vip \
newnius/hbase:1.2.6
```

```bash
docker service create \
--name hbase-slave1 \
--network swarm-net \
--hostname hbase-slave1 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode vip \
newnius/hbase:1.2.6
```

```bash
docker service create \
--name hbase-slave2 \
--network swarm-net \
--hostname hbase-slave2 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode vip \
newnius/hbase:1.2.6
```

```bash
docker service create \
--name hbase-slave3 \
--network swarm-net \
--hostname hbase-slave3 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode vip \
newnius/hbase:1.2.6
```

## Init && Test

#### Start Hadoop
Read [newnius/hadoop](https://hub.docker.com/r/newnius/hadoop/) to learn how to run & init hadoop

#### Start Zookeeper cluster
```bash
ZOOKEEPER_NUM=3
for i in $( seq 1 $ZOOKEEPER_NUM )
do
  docker service create \
  -e MYID=${i} \
  -e SERVERS=${zookeeper_str} \
  --replicas 1 \
  --network swarm-net \
  --endpoint-mode dnsrr \
  --name=zookeeper_node${i} \
  mesoscloud/zookeeper:3.4.8-ubuntu-14.04
done
```

#### Start HBase
```bash
bash bin/start-hbase.sh
```

#### Browse
Now you can see HBase cluster in `http://hadoop-master:16010` in browser. ([newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/) needed.)
