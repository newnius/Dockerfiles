

```bash
docker service create \
	--name zabbix-agent-custom \
	--hostname="{{.Node.Hostname}}" \
	--network swarm-net \
	--detach=true \
	--env ZBX_HOSTNAME="{{.Node.Hostname}}" \
	--mode global\
	--env ZBX_SERVER_HOST=zabbix-server \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/zabbix-agent:normal
```


Boil CPU

```bash
for i in `seq 1 $(cat /proc/cpuinfo |grep "physical id" |wc -l)`; do dd if=/dev/zero of=/dev/null & done
```

Calm it down

```bash
pkill dd
```
