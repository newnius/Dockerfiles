rpi-port-forward
==========================
Forward your traffic behind NAT etc.

## Usage

Define the following environment variables to configure port-forwarding.

Variable | Description | Optional
-------- | ----------- | --------
REMOTE_HOST | IP or address of the host you want to forward traffic to | no
REMOTE_PORT | Port on remote host to forward traffic to | yes (80)
LOCAL_PORT | Port where container listens | yes (80)

The `socat` process within the container will listen by default to port 80, use `-p`docker
flag to map the port of the local machine where it will listen to traffic to be forwarded.


```bash
docker run \
--name port-forward \
-d \
--restart always \
--publish 81:80 \
--ENV REMOTE_HOST=example.com \
--ENV REMOTE_PORT=82 \
--ENV LOCAL_POST=80 \
newnius/rpi-port-forward
```

Thanks to: [marcnuri/port-forward](https://hub.docker.com/r/marcnuri/port-forward/)
