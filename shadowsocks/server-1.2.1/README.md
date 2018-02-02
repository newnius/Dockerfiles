# Shadowsocks

__Across the Great Wall, we can reach every corner in the world.__

## Run as server
```
docker run \
-d \
--restart always \
--publish 1081:1080 \
--name ssserver \
newnius/shadowsocks:server-1.2.1 \
ssserver -p 1080 -k PASSWORD -m METHOD
```
