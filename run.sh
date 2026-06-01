#!/bin/sh
#if [ -d /opt/homebrew/opt/ruby@3.4/bin ]; then
#	export PATH=/opt/homebrew/opt/ruby@3.4/bin:$PATH
#fi
BASEURL='--baseurl='
DRAFTS=${DRAFTS:-'--drafts'}
HOST_ADDR=${HOST:-0.0.0.0}
PORT=${PORT:-4040}
while [ $# -ge 1 ]; do
	if [ $1 = "renew" ]; then
		rm -rf _site .jekyll-metadata
	elif [ $1 = "clean" ]; then
		DRAFTS=
	elif [ $1 = "subdir" ]; then
		BASEURL=
	fi
	shift
done
bundle config set --local path 'vendor'
bundle install || exit $?
bundle exec jekyll serve $DRAFTS --host=$HOST_ADDR --port=$PORT --incremental $BASEURL
