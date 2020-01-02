# Deploy dnsmasq in docker

## Deploy

```bash
docker run \
	--name dnsmasq \
	-d \
	--restart always \
	--cap-add=NET_ADMIN \
	--publish 53:53/udp \
	--net host \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/dnsmasq/,dst=/etc/dnsmasq.d/ \
	newnius/dnsmasq
```

`--net host` is required, without which in other containers we may get `nslookup: can't resolve '(null)': Name does not resolve` error and would see following errors when `dig`

```
/ # dig @192.168.0.3 blog.newnius.com
;; reply from unexpected source: 172.17.0.1#53, expected 192.168.0.3#53
;; reply from unexpected source: 172.17.0.1#53, expected 192.168.0.3#53
;; reply from unexpected source: 172.17.0.1#53, expected 192.168.0.3#53
```

