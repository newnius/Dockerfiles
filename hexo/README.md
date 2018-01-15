# Dockered Hexo

## What is `Hexo`

> `Hexo` is a fast, simple and powerful blog framework. You write posts in Markdown (or other languages) and Hexo generates static files with a beautiful theme in seconds.

Documents: [Hexo](https://hexo.io/)

## How to setup your Hexo blog quickly

1. Create a new directory in your computer (for example: `/path/to/blog`)
2. Create a docker service using the following command
3. View http://localhost:4000 to see your running blog

```
docker service create \
--name hexo \
--replicas 1 \
--publish 4000:4000 \
--env GIT_EMAIL="username@example.com" \
--env GIT_NAME="username" \
--mount type=bind,source=/path/to/blog,target=/blog \
newnius/hexo
```

## Notice

_This command creates a docker swarm service, you can use `docker run ...` instead in your way_

_The first time you run this command, it will init the blog and will take some time to install some packages._

_If you live in China, the npm source mirror is blocked and the inititial may not be completed, you can download the required packages and put them where they should be._
