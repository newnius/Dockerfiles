# Shadowsocks

__Across the Great Wall, we can reach every corner in the world.__

## Run as server
```
docker run \
-d \
--restart always \
--publish 1080:1080 \
--name ssserver \
newnius/shadowsocks:server-1.2.1 \
ssserver -p 1080 -k PASSWORD -m METHOD
```

## Run as client
```
docker run \
-d \
--restart always \
--publish 1081:1081 \
--name sslocal \
newnius/shadowsocks:client-1.2.1 \
sslocal -s SERVER_IP -p 1080 -l 1081 -k PASSWORD -m METHOD
```
