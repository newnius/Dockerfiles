FROM alpine:3.8

MAINTAINER Newnius <newnius.cn@gmail.com>

USER root

# Prerequisites
RUN apk add --no-cache openssl

# Install frp
ENV VERSION 0.21.0

RUN wget -O frp.tar.gz https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
	tar -xzf frp.tar.gz -C / && rm frp.tar.gz

RUN mv /frp_${VERSION}_linux_amd64 /frp

WORKDIR /frp

CMD ["/frp/frps", "-c", "/frp/frps.ini"]
