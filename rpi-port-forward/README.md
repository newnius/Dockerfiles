# forward your traffic behind NAT etc.

```
docker service create \
--name socat \
--publish 81:80 \
--ENV REMOTE_HOST=example.com \
--ENV REMOTE_PORT=82 \
--ENV LOCAL_POST=80 \
newnius/rpi-port-forward
```

Ref: [marcnuri/port-forward](https://hub.docker.com/r/marcnuri/port-forward/)
