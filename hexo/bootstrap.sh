#!/bin/sh

# configure git
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME

# init hexo if dir is empty
if ! [ "$(ls -A blog)" ]; then
	hexo init blog && npm install blog
fi

# run hexo as production / developemnt mode
if [[ $1 == "production" ]]; then
				hexo server
else
				hexo server -s
fi
