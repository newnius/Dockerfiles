

```bash
docker run -it --rm --cap-add=NET_ADMIN --device /dev/net/tun -e NETWORK_ID=0000000000 newnius/zerotier:latest bash
```
