# deploy kafka with docker

## docker swarm

```bash
docker service create \
	--name kafka_1 \
	--hostname=kafka_1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env BROKER_ID=1 \
	--env ZOOKEEPER_CONNECT=zookeeper_node1:2181,zookeeper_node2:2181,zookeeper_node3:2181 \
	--endpoint-mode dnsrr \
	newnius/kafka:2.1.1
```

## Configuration

### By environment variable

Currently, properties below are supported.

| env | file | property |
| --- | --- | --- |
| BROKER_ID | server.properties | broker.id |
| ZOOKEEPER_CONNECT | server.properties | zookeeper.connect |


### By configuration file

```bash
docker service create \
	--name kafka \
	--hostname=kafka \
	--network swarm-net \
	--detach=true \
	--replicas 1 \
	--endpoint-mode dnsrr \
	--mount type=bind,src=/data/kafka/,dst=/config/kafka/,readonly \
	newnius/kafka:2.1.1
```

