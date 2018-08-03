# based on alpine

## Create a hadoop cluster in swarm mode

`--hostname` needs docker 1.13 or higher

```bash
docker service create \
--name hadoop-master \
--hostname hadoop-master \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```bash
docker service create \
--name hadoop-slave1 \
--hostname hadoop-slave1 \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```bash
docker service create \
--name hadoop-slave2 \
--hostname hadoop-slave2 \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```bash
docker service create \
--name hadoop-slave3 \
--hostname hadoop-slave3 \
--network swarm-net \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

## Init && Test

In the first deploy, format dfs first

### stop cluster (in master)
```bash
sbin/stop-dfs.sh
```

### format hdfs (in master)
```bash
bin/hadoop namenode -format
```

### start cluster (in master)
```bash
sbin/start-dfs.sh
```

### Run a test job

```bash
# prepare input data
bin/hadoop dfs -mkdir -p /user/root/input

bin/hadoop dfs -put etc/hadoop/* /user/root/input
```
```bash
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.4.jar grep input output 'dfs[a-z.]+'

```

### monitor cluster in browser

YARN: hadoop-master:8088

HDFS: hadoop-master:50070

_Proxy needed: newnius/docker-proxy_
