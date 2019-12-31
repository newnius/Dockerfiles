# Deploy dnsmasq in docker

## Deploy

#### Run as Server

```bash
docker run \
	--name dnsmasq \
	-d \
	--restart always \
	--cap-add=NET_ADMIN \
	--publish 53:53/udp \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/dnsmasq/,dst=/etc/dnsmasq.d/ \
	newnius/dnsmasq
```

