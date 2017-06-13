https://github.com/tinyproxy/tinyproxy


docker service create \
--name tinyproxy \
--publish mode=host,published=8888,target=8888 \
--mount type=bind,source=/mnt/data/tinyproxy,target=/etc/tinyproxy \
newnius/tinyproxy
