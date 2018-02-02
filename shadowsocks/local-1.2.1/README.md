# Shadowsocks

__Across the Great Wall, we can reach every corner in the world.__

## Run as client
```
docker run \
-d \
--restart always \
--publish 1082:1080 \
--name sslocal \
newnius/shadowsocks:client-1.2.1 \
sslocal -s SERVER_IP -p 1081 -l 1080 -k PASSWORD -m METHOD
```
