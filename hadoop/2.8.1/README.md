# based on alpine

## Create a hadoop cluster in swarm mode

`--hostname` needs docker 1.13 or higher

```
docker service create \
--name hadoop-master \
--network swarm-net \
--hostname hadoop-master \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```
docker service create \
--name hadoop-slave1 \
--network swarm-net \
--hostname hadoop-slave1 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```
docker service create \
--name hadoop-slave2 \
--network swarm-net \
--hostname hadoop-slave2 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

```
docker service create \
--name hadoop-slave3 \
--network swarm-net \
--hostname hadoop-slave3 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop
```

## Init && Test

In the first deploy, format dfs first

### stop cluster (in master)
`sbin/stop-yarn.sh`
`sbin/stop-dfs.sh`

### remove previous data (in all nodes)
clear all data in /tmp in all nodes

### format hdfs (in master)
```
bin/hadoop namenode -format
```

### start cluster (in master)
`sbin/start-dfs.sh`
`sbin/start-yarn.sh`

### Run a test job

bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.4.jar grep input output 'dfs[a-z.]+'

Note: there is no such dir default, you can add data by

```
bin/hadoop dfs -mkdir -p /user/root/input
```
and
```
bin/hadoop dfs -put etc/hadoop/* /user/root/input
```

### monitor cluster in browser

YARN: hadoop-master:8088

HDFS: hadoop-master:50070

_Proxy needed: newnius/docker-proxy_
