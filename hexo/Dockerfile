FROM node:9.3-alpine

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk --no-cache add git

RUN npm install hexo-cli -g

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /blog

ENTRYPOINT ["/etc/bootstrap.sh", "development"]
