# Run distributed Aapache HBase with Docker

## Setup the zookeeper cluster

see [zookeeper](https://github.com/newnius/scripts/tree/master/zookeeper)

Assume the nodes are `zookeeper-node1`, `zookeeper-node2`, `zookeeper-node3`

## Setup HDFS cluster

See [hadoop](https://github.com/newnius/scripts/tree/master/hadoop)

Assume the nodes are `hadoop-master`, `hadoop-slave1`, `hadoop-slave2`, `hadoop-slave3`

## Setup HBase cluster

```bash
docker service create \
	--name hbase-master \
	--hostname hbase-master \
	--network swarm-net \
	--endpoint-mode dnsrr \
	newnius/hbase:1.2.6
```

```bash
docker service create \
	--name hbase-slave1 \
	--hostname hbase-slave1 \
	--network swarm-net \
	--endpoint-mode dnsrr \
	newnius/hbase:1.2.6
```

```bash
docker service create \
	--name hbase-slave2 \
	--hostname hbase-slave2 \
	--network swarm-net \
	--endpoint-mode dnsrr \
	newnius/hbase:1.2.6
```

```bash
docker service create \
	--name hbase-slave3 \
	--hostname hbase-slave3 \
	--network swarm-net \
	--endpoint-mode dnsrr \
	newnius/hbase:1.2.6
```

## Init && Test

```bash
bin/start-hbase.sh
```

### Browse

Now you can see HBase cluster in `http://hbase-master:16010` in browser. ([newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/) needed.)
