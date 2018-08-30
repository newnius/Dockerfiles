# Deploy frps / frpc with docker

## Start frps

```bash
docker service create \
  --name frps \
  --hostname frps \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --publish 7500:7500 \
  --publish 7000:7000 \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  --mount type=bind,source=/data/frp/frps.ini,target=/frp/frps.ini \
  newnius/frp:v0.21.0
```

## Start frpc

```bash
docker service create \
  --name frpc \
  --hostname frpc \
  --network swarm-net \
  --replicas 1 \
  --detach=true \
  --endpoint-mode dnsrr \
  --mount type=bind,source=/etc/localtime,target=/etc/localtime \
  --mount type=bind,source=/data/frp/frpc.ini,target=/frp/frpc.ini \
  newnius/frp:v0.21.0
```
