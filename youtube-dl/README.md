# Run youtube-dl in docker

## Run

```bash
docker run \
	-it \
	--rm \
	--name youtube-dl \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/youtube/,dst=/output/ \
	newnius/youtube-dl youtube-dl -o '/output/%(id)s.%(ext)s' 'https://www.youtube.com/watch?v=LXb3EKWsInQ'
```

