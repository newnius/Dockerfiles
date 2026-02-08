ARG NODE_VERSION=25
FROM node:${NODE_VERSION}-bookworm-slim AS build

ARG CRONICLE_VERSION=v0.9.105

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        python3 \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/cronicle

RUN curl -L https://github.com/jhuckaby/Cronicle/archive/${CRONICLE_VERSION}.tar.gz | tar zxvf - --strip-components 1 \
    && npm install \
    && node bin/build.js dist \
    && npm cache clean --force

RUN mkdir -p /opt/cronicle/data /opt/cronicle/logs /opt/cronicle/plugins

# ---

FROM node:${NODE_VERSION}-bookworm-slim

ARG CRONICLE_VERSION
ENV CRONICLE_VERSION=${CRONICLE_VERSION}
ENV CRONICLE_foreground=1
ENV CRONICLE_echo=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/cronicle

COPY --from=build /opt/cronicle /opt/cronicle
COPY entrypoint.sh /opt/cronicle/entrypoint.sh

RUN chmod +x /opt/cronicle/entrypoint.sh

USER node

VOLUME ["/opt/cronicle/data", "/opt/cronicle/logs", "/opt/cronicle/plugins", "/opt/cronicle/queue"]
EXPOSE 3012

ENTRYPOINT ["/opt/cronicle/entrypoint.sh"]
