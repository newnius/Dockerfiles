FROM python:3-alpine

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl

CMD ["youtube-dl", "--help"]
