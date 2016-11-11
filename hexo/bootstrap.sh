#! /bin/bash

if [ "$1" == "server" ]; then
  # start hexo server
  hexo server
else
  # do nothing, just wait
  while true; do sleep 1000; done 
fi
