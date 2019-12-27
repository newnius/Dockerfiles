# Deploy rsync in docker

## Deploy

#### Run as Server

```bash
docker run \
	--name rsync \
	-d \
	--restart always \
	--cpus 1.0 \
	--publish 873:873 \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/,dst=/data/ \
	--mount type=bind,src=/data/rsync/config/,dst=/config/ \
	newnius/rsync
```

#### Run as Client

```bash
docker run \
	-it \
	--rm \
	--cpus 1.0 \
	--name rsync \
	--env AUTH_USER=newnius \
	--env AUTH_PASSWORD=password \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/,dst=/data/ \
	newnius/rsync rsync -avzP --delete --password-file=/etc/rsyncd.secret newnius@192.168.1.101::data/ /data/
```


