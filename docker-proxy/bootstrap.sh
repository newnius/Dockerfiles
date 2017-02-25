#! /bin/bash

/etc/init.d/ssh start
ssh -t -t -D 0.0.0.0:7001 -o StrictHostKeyChecking=no localhost
