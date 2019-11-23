FROM golang:1.13-alpine AS build

MAINTAINER Newnius <newnius.cn@gmail.com>

# Optionally set HUGO_BUILD_TAGS to "extended" when building like so:
#   docker build --build-arg HUGO_BUILD_TAGS=extended .
ARG HUGO_BUILD_TAGS

ARG CGO=1
ENV CGO_ENABLED=${CGO}
ENV GOOS=linux
ENV GO111MODULE=on

RUN apk add --no-cache git

RUN git clone https://github.com/gohugoio/hugo.git /hugo

WORKDIR /hugo

RUN go install


# ---

FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

COPY --from=build /go/bin/hugo /usr/bin/hugo

ADD bootstrap.sh /etc/bootstrap.sh

WORKDIR /blog

# Expose port for live server
EXPOSE 1313

ENTRYPOINT ["/etc/bootstrap.sh"]
