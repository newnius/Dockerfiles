#!/bin/bash

: ${BOOTSTRAP_DIR:=/bootstrap}

if [ -d "$BOOTSTRAP_DIR" ]; then
	run-parts $BOOTSTRAP_DIR
fi

/var/www/html/build/env/bin/desktop runserver 0.0.0.0:8888
