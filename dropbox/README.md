# Run Dropbox in docker

Run Dropbox in docker containers.

Even if the container exits, the session will still exist.

## Deploy

#### normal

#### k8s

#### swarm

```bash
docker service create \
        --name dropbox \
        --hostname dropbox \
        --replicas 1 \
        --detach=true \
        --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
        --mount type=bind,source=/home/dropbox/.dropbox,target=/root/.dropbox \
        --mount type=bind,source=/data/,target=/root/Dropbox \
        newnius/dropbox
```

## Login

Run following command

```bash
docker ps | grep dropbox | cut -f1 -d" " | xargs docker logs --tail 5
```

until you will see outputs like

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=01010101010101010101010101010101 to link this device.
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=01010101010101010101010101010101 to link this device.
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=01010101010101010101010101010101 to link this device.
```

Visit the url to link your account.
