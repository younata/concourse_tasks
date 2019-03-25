#!/bin/bash -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code

apk add --no-cache libcurl
apk add --no-cache --virtual build-dependencies build-base libxml2-dev libxslt-dev

gem install html-proofer

htmlproofer --assume-extension --internal-domains $DOMAIN .
