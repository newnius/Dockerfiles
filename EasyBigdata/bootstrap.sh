#!/bin/bash

make apps

/var/www/html/build/env/bin/desktop runserver 0.0.0.0:8888
