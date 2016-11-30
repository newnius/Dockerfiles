https://hexo.io/zh-cn/

http://theme-next.iissnan.com/

First Time:
docker service create --name hexo --publish 4000:4000 --mount type=bind,source=/mnt/data/blog,target=/blog newnius/hexo

Start Server:
docker service create --name hexo --publish 4000:4000 --mount type=bind,source=/mnt/data/blog,target=/blog newnius/hexo /etc/bootstrap.sh server
