Forked from [lihaixin/lantern/](https://hub.docker.com/r/lihaixin/lantern/) for upgrade.

__Notice: by default, proxyAll=true__

## Swarm mode

```bash
docker service create \
--name lantern \
--publish 3128:3128 \
newnius/lantern
```

## non-swarm mode
docker run --rm --name lantern -p 3128:3128 -p 1080:1080 newnius/lantern

