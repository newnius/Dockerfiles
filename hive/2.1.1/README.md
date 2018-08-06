Run Aapache Hive with Docker

## Prequirements

Assume you already have one Hadoop cluster whose master node host is `hadoop-master`;

Assume you already have a Mysql server whose host is `mysql`;

You can specify them in `conf/hive-site.xml`;

## Start Hive Node

```
docker service create \
	--name hive \
	--hostname hive \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/hive:2.1.1
```

## Init && Test
Init HIVE for the first time

#### Create HIVE dir in HDFS

```bash
$HADOOP_HOME/bin/hdfs dfs -mkdir /tmp
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /tmp
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse
```

#### Init MetaStore

```bash
schematool --dbType mysql --initSchema
```

#### Validate Installation

Run `hive` to start the hive shell

If the following command is executed successfully, then the installation is fine.

```hive
CREATE TABLE pokes (foo INT, bar STRING);
```
