FROM alpine:3.8

MAINTAINER Newnius <docker@newnius.com>

ARG DEF_REMOTE_PORT=80
ARG DEF_LOCAL_PORT=80

ENV REMOTE_PORT=$DEF_REMOTE_PORT
ENV LOCAL_PORT=$DEF_LOCAL_PORT

RUN apk add --no-cache socat

CMD socat tcp-listen:$LOCAL_PORT,reuseaddr,fork tcp:$REMOTE_HOST:$REMOTE_PORT
