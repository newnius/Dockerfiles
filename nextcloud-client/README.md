# Run Nextcloud Client in docker

## What is `Nextcloud`


```
docker run \
	-it \
	--rm \
	--name nextcloud-client \
	--mount type=bind,source=/path/to/file,target=/data \
	newnius/nextcloud-client nextcloudcmd -u $USER -p $PASSWORD /data https://demo.nextcloud.com/remote.php/webdav/dir
```

