#!/bin/sh

# init hugo if dir is empty
if ! [ "$(ls -A /blog )" ]; then
	hugo new site /blog
fi

hugo server --bind 0.0.0.0
