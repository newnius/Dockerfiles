# Deploy one Hadoop Cluster with docker

## Start Master

```bash
docker service create \
  --name hadoop-master \
  --hostname hadoop-master \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  newnius/hadoop:2.9.1
```

## Start slaves

```bash
docker service create \
  --name hadoop-slave1 \
  --hostname hadoop-slave1 \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  newnius/hadoop:2.9.1
```

```bash
docker service create \
  --name hadoop-slave2 \
  --network swarm-net \
  --hostname hadoop-slave2 \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  newnius/hadoop:2.9.1
```

```bash
docker service create \
  --name hadoop-slave3 \
  --hostname hadoop-slave3 \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  newnius/hadoop:2.9.1
```

## Init for the first time

#### format dfs first
Run these commands on the master node.

```bash
# stop HDFS services
sbin/stop-dfs.sh

# format HDFS meta data
bin/hadoop namenode -format

# restart HDFS services
sbin/start-dfs.sh
```

## Run a test job
To make sure youui have successfully setup the Hadoop cluster, just run the floowing commands to see if it is executed well.

```bash
# prepare input data
bin/hadoop dfs -mkdir -p /user/root/input

# copy files to input path
bin/hadoop dfs -put etc/hadoop/* /user/root/input

# submit the job
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples*.jar grep input output 'dfs[a-z.]+'
```

## Browse the web UI
You can expose the ports in the script, but I'd rather not since the slaves shoule occupy the same ports.

To access the web UI, deploy another (socks5) proxy to route the traffic.

If you don't one, try [newnius/docker-proxy](https://hub.docker.com/r/newnius/docker-proxy/), it is rather easy to use.

Visit [hadoop-master:8088](http://hadoop-master:8088) fo YARN pages.

Visit [hadoop-master:50070](http://hadoop-master:50070) fo YARN pages.

## Custom configuration

To persist data or modify the conf files, refer to the following script.

The `/config/hadoop` path is where new conf files to be replaces, you don't have to put all the files.

```bash
docker service create \
  --name hadoop-master \
  --hostname hadoop-master \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  --mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
  --mount type=bind,source=/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
  --mount type=bind,source=/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
  newnius/hadoop:2.9.1
```
