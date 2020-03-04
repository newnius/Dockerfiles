# Run git client in docker

## Deploy

```bash
docker run \
	--name git-cli \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/,dst=/data/ \
	newnius/git-cli git push origin
```

