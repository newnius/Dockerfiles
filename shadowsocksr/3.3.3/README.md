# ShadowsocksR

__Across the Great Wall, we can reach every corner in the world.__

## Run as server
```
docker run \
-d \
--restart always \
--publish 1081:1080 \
--name ssrserver \
newnius/shadowsocksr:3.3.3 \
ssrserver -p 1080 -k PASSWORD -m METHOD
```

## Run as client
```
docker run \
-d \
--restart always \
--publish 1082:1080 \
--name ssrlocal \
newnius/shadowsocksr:3.3.3 \
ssrlocal -s SERVER_IP -p 1081 -l 1080 -k PASSWORD -m METHOD
```
