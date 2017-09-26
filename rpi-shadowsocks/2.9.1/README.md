# Run shadowsocks in RaspberryPi

## Run as server
```
docker run \
-d \
--restart always \
--publish 1080:1080 \
--name shadowsocks \
newnius/rpi-shadowsocks \
ssserver -p 1080 -k PASSWORD -m aes-256-cfb
```

## Run as client
```
docker run \
-d \
--restart always \
--publish 1081:1081 \
--name shadowsocks \
newnius/rpi-shadowsocks \
sslocal -s SERVER_IP -p 1080 -l 1081 -k PASSWORD -m aes-256-cfb
```
