Run Aapache Hive with Docker

## Create a hadoop cluster with Hive supported in swarm mode

`--hostname` needs 1.13 or higher

```
docker service create \
--name hadoop-master \
--network swarm-net \
--hostname hadoop-master \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hive:2.1.1
```

```
docker service create \
--name hadoop-slave1 \
--network swarm-net \
--hostname hadoop-slave1 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4
```

```
docker service create \
--name hadoop-slave2 \
--network swarm-net \
--hostname hadoop-slave2 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4
```

```
docker service create \
--name hadoop-slave3 \
--network swarm-net \
--hostname hadoop-slave3 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4
```

## Init && Test

#### Start Hadoop
Read `newnius/hadoop` to learn how to init hadoop

#### Mysql
```bash
docker service create \
--name mysql \
--network swarm-net \
-e MYSQL_ROOT_PWDDWORD=123456 \
mysql:5.7
```

#### init hive
```bash
bash /etc/init_hive.sh
```
