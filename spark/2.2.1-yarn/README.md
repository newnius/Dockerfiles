# Deploy Spark On Yarn

## Client

```bash
docker service create \
	--name spark-client \
	--hostname spark-client \
	--network swarm-net \
	--replicas 1 \
	--detach true \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/spark:2.2.1-yarn
```

## Validate installation

#### spark-submit PI

```bash
spark-submit \
	--master yarn \
	--deploy-mode cluster \
	--class org.apache.spark.examples.JavaSparkPi \
	./examples/jars/spark-examples*.jar 100
```

#### spark-shell HDFS wordcount

Enter `spark-shell --master yarn` to enter shell.

```shell
val lines = sc.textFile("hdfs://hadoop-master:8020/user/root/input")

val words = lines.flatMap(_.split("\\s+"))

val wc = words.map(word => (word, 1)).reduceByKey(_ + _)

wc.collect()

val cnt = words.map(word => 1).reduce(_ + _)
```

## Browse the web UI

In Spark On Yarn mode, the spark jobs will occur in the Yarn web UI.

## Custom configuration

To persist data or modify the conf files, refer to the following script.

The `/config/hadoop` path is where new conf files to be replaces, you don't have to put all the files.


```bash
docker service create \
	--name spark-client \
	--hostname spark-client \
	--network swarm-net \
	--replicas 1 \
	--detach true \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  --mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	newnius/spark:2.2.1-yarn
```
