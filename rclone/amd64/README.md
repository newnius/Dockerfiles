# Deploy rclone in docker

## Deploy

```bash
docker run \
	--name rclone \
	-d \
	--restart always \
	--cpus 0.2 \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/,dst=/data,readonly \
	--mount type=bind,src=/home/rclone/,dst=/root/ \
	newnius/rclone
```

## Add remote

```bash
docker exec -it rclone rclone config
```

## Sync

Rewrite file `/home/rclone/sync.sh` and restart the rclone container, done!

## Reference

[Install | rclone](https://rclone.org/install/)

[ncw/rclone](https://github.com/ncw/rclone)

