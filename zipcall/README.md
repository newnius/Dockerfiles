# Dockered Zipcall

## What is `Zipcall`


Documents: [Zipcall](https://github.com/ianramzy/decentralized-video-chat)

Demo: [Zipcall](https://zipcall.io)

## How to setup

1. Sign up for free twilio account https://www.twilio.com/login
2. Get your Account SID and Auth Token from the Twillio console
3. Create a docker service using the following command
4. View http://localhost:3000 to see your running video chat service

```
docker service create \
	--name zipcall \
	--replicas 1 \
	--publish 3000:3000 \
	--env TWILIO_ACCOUNT_SID="SID" \
	--env LOCAL_AUTH_TOKEN="Token" \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	newnius/zipcall
```

## Notice

_This command creates a docker swarm service, you can use `docker run ...` instead in your way_
