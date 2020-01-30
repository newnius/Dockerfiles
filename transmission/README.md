# Deploy transmission in docker

## Deploy

```bash
docker run \
	--name transmission \
	-d \
	--restart always \
	--publish 9091:9091 \
	--publish 51413:51413 \
	--publish 51413:51413/udp \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/Downloads/,dst=/root/Downloads/ \
	--mount type=bind,src=/data/trasmission/config/,dst=/var/lib/transmission/config/ \
	newnius/transmission
```

