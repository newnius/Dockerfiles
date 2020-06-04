FROM node:13-alpine

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk --no-cache add git

RUN git clone https://github.com/ianramzy/decentralized-video-chat.git /zipcall

RUN cd /zipcall && npm install

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /zipcall

CMD ["/etc/bootstrap.sh"]
