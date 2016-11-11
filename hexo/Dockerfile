FROM node:latest

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apt-get -y update && apt-get -y install git && apt-get install -y vim &&  npm install -g hexo-cli

RUN npm install hexo-generator-feed --save

#Local Search
RUN npm install hexo-generator-searchdb --save

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /blog

ENTRYPOINT ["/etc/bootstrap.sh", "nothing"]
