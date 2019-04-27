# Deploy MEGA.nz in docker

## Start

```bash
docker service create \
	--name mega \
	--hostname mega \
	--replicas 1 \
	--detach=true \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data,dst=/data/,readonly \
	--mount type=bind,src=/home/mega/.megaCmd/,dst=/root/.megaCmd/ \
	newnius/mega
```

## Login

```bash
docker exec -it mega.1.xxxx mega-login [--auth-code CODE ] $MEGAEMAIL $MEGA_PASS
```

*It is suggested to enablt 2FA for security reasons.*

## Sync

```bash
docker exec -it mega.1.xxxx mega-sync /data /remote
```


## Reference

[Installation in Debian 9 fails at the post-install script](https://github.com/meganz/MEGAcmd/issues/6)

[MEGAcmd](https://mega.nz/cmd)

