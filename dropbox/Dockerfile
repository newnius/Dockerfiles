FROM python:2.7.15-slim-stretch

MAINTAINER Newnius <newnius.cn@gmail.com>

WORKDIR /root

RUN apt-get update \
        && apt-get install -y wget \
        && wget -O dropbox.tgz "https://www.dropbox.com/download?plat=lnx.x86_64" \
        && tar xzf dropbox.tgz \
        && rm dropbox.tgz

RUN wget -O dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py" \
	&& chmod +x dropbox.py

ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]
