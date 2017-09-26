#!/bin/bash

image=newnius/rpi-shadowsocks:2.9.1
docker build -t ${image} .
docker push ${image}
