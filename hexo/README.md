https://hexo.io/zh-cn/

http://theme-next.iissnan.com/

First Time(not inited):
docker service create \
--name hexo \
--publish 80:4000 \
-e GIT_EMAIL="me@newnius.com" \
-e GIT_NAME="newnius" \
--mount type=bind,source=/mnt/data/blog,target=/blog \
newnius/hexo

Start Server:
docker service create \
--name hexo \
--publish 80:4000 \
-e GIT_EMAIL="me@newnius.com" \
-e GIT_NAME="newnius" \
--mount type=bind,source=/mnt/data/blog,target=/blog \
newnius/hexo server
