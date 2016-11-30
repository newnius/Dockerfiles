FROM node:latest

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apt-get -y update && apt-get -y install git && apt-get install -y vim &&  npm install -g hexo-cli

RUN npm install hexo-generator-feed --save

#Local Search
RUN npm install hexo-generator-searchdb --save

RUN npm install hexo-algolia --save

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /blog

CMD ["bash", "/etc/bootstrap.sh", "nothing"]
