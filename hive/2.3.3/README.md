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
	newnius/hive:2.3.3
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

#### Start MetaStore service
```bash
nohup hive --service metastore &
```

#### Validate Installation

Run `hive` to start the hive shell

If the following command is executed successfully, then the installation is fine.

```hive
CREATE TABLE pokes (foo INT, bar STRING);
```

## Custom configuration
To persist data or modify the conf files, refer to the following script.

The `/config/hive` path is where new conf files to be replaces, you don't have to put all the files.

```bash
docker service create \
	--name hive \
	--hostname hive \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hive/config,target=/config/hive \
	newnius/hive:2.3.3
```
