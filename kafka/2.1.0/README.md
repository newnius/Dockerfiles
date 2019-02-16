TBD

```bash
docker service create \
	--name kafka \
	--hostname=kafka \
	--network swarm-net \
	--detach=true \
	--replicas 1 \
	--endpoint-mode dnsrr \
	newnius/kafka:2.1.0
```
