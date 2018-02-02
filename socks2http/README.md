# socks2http

Convert Socks(5) proxy to http proxy.

#### Example

```bash
docker run \
-d \
--restart always \
--publish 8118:8118 \
--name socks2http \
newnius/socks2http SOCKS5_PROXY_ADDR:PORT
```

_`SOCKS_PROXY_ADDR` can not be 127.0.0.1_
