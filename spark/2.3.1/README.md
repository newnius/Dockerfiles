# Deploy Spark Cluster of standalone mode

## Master

```bash
docker service create \
	--name spark-master \
	--hostname spark-master \
	--network swarm-net \
	--replicas 1 \
	--detach true \
	--endpoint-mode dnsrr \
	newnius/spark:2.3.1 master
```

## Slaves

```bash
docker service create \
	--name spark-slave \
	--network swarm-net \
	--replicas 5 \
	--detach true \
	--endpoint-mode dnsrr \
	newnius/spark:2.3.1 slave spark://spark-master:7077
```

## Validate installation

#### spark-submit PI

```bash
spark-submit \
	--master spark://spark-master:7077 \
	--deploy-mode cluster \
	--class org.apache.spark.examples.JavaSparkPi \
	./examples/jars/spark-examples*.jar 100
```

#### spark-shell HDFS wordcount

Enter `spark-shell --master spark://spark-master:7077` to enter shell.

```shell
val lines = sc.textFile("hdfs://hadoop-master:8020/user/root/input")

val words = lines.flatMap(_.split("\\s+"))

val wc = words.map(word => (word, 1)).reduceByKey(_ + _)

wc.collect()

val cnt = words.map(word => 1).reduce(_ + _)
```

## Browse the web UI

You can expose the ports in the script, but I'd rather not since the slaves shoule occupy the same ports.

To access the web UI, deploy another (socks5) proxy to route the traffic.

If you don't one, try [newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/), it is rather easy to use.

Visit [spark-master:8080](http://spark-master:8080) to view the cluster.
