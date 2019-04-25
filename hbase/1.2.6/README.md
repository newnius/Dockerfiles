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
# inside hbase-master container
bin/start-hbase.sh
```

## Browse

Now you can see HBase cluster in `http://hbase-master:16010` in browser. ([newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/) needed.)

## Access outside the swarm

Start Thrift servuce

```bash
# inside hbase-master container
bin/hbase-daemon.sh start thrift
```

Start another service to expose the thrift port 9090.

```bash
docker service create \
	--name hbase-forwarder \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hbase-master \
	--env REMOTE_PORT=9090 \
	--env LOCAL_PORT=9090 \
	--publish mode=host,published=9090,target=9090 \
	newnius/port-forward
```

```python
import happybase
def get_tables_name(host,port):
    conn = happybase.Connection(host=host,port=port,protocol='compact',transport='framed')
    return conn.tables()
```

*Notice: by default, `hbase.regionserver.thrift.framed` and `hbase.regionserver.thrift.compact` is set to `true` for security reasons*

## Customize the Configuration

mount your configuration files to `/config/hbase` and the bootstrap script will replace them.

```bash
docker service create \
	--name hbase-master \
	--hostname hbase-master \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/master,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6
```

You can find the full scripts here at [scripts/hbase](https://github.com/newnius/scripts/tree/master/hbase)
