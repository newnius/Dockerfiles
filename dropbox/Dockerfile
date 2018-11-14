FROM python:3.7-slim-stretch

MAINTAINER Newnius <newnius.cn@gmail.com>

WORKDIR /root

RUN apt-get update \
        && apt-get install -y wget \
        && wget -O dropbox.tgz "https://www.dropbox.com/download?plat=lnx.x86_64" \
        && tar xzf dropbox.tgz \
        && rm dropbox.tgz

ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]
