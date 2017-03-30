FROM node:latest

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apt-get -y update && apt-get -y install git &&  npm install -g hexo-cli

RUN npm install hexo-generator-feed --save

#Local Search
RUN npm install hexo-generator-searchdb --save

RUN npm install --save hexo-algolia@0.2.0

RUN npm install hexo-deployer-git --save


ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /blog

ENTRYPOINT ["/etc/bootstrap.sh"]
