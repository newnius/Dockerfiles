

## Build image

```bash
sudo docker build -t openclaw .
```

## Setup

```bash
mkdir -p /data/openclaw/

sudo docker run \
    -it --rm \
    --name copenclaw \
    --hostname openclaw \
    --mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
    --mount type=bind,src=/data/claw-openclaw/,dst=/root/ \
    openclaw openclaw onboard
```

## Add channel

```bash
openclaw pairing list telegram
openclaw pairing approve telegram <CODE>
```


## Run

```bash
sudo docker run \
    -d \
    --restart always \
    --name copenclaw \
    --hostname openclaw \
    --mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
    --mount type=bind,src=/data/claw-openclaw/,dst=/root/ \
    openclaw
```