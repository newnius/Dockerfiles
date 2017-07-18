FROM ubuntu:16.04

MAINTAINER Newnius <docker@newnius.com>

WORKDIR /root

RUN apt-get update  && \
        apt-get -y install wget libappindicator3-1 && \
        wget https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-64-bit.deb && \
        dpkg -i lantern-installer-beta-64-bit.deb && \
        rm -rf lantern-installer-beta-64-bit.deb && \
        apt-get -f install && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/lantern", "--configdir=/root", "--headless=true", "--proxyall=true", "--startup=false", "--clear-proxy-settings=false", "--addr=0.0.0.0:3128", "--uiaddr=0.0.0.0:8080", "--socksaddr=0.0.0.0:1080"]
