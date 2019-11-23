# Dockered Hugo

## What is `Hugo`

> Hugo is a static HTML and CSS website generator written in Go. It is optimized for speed, ease of use, and configurability. Hugo takes a directory with content and templates and renders them into a full HTML website.

Documents: [Hugo](https://gohugo.io/)

```
docker run \
	--name hugo \
	-d \
	--restart always \
	--hostname hugo \
	-p 1313:1313 \
	--mount type=bind,source=/path/to/blog,target=/blog \
	newnius/hugo
```

