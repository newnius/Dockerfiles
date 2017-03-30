#! /bin/bash

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME

if [ "$1" = "server" ]; then
  # start hexo server
  echo "starting hexo..."
  hexo server
else
  # do nothing, just wait
  while true; do sleep 1000; done 
fi
