#!/bin/sh -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code

/usr/local/bundle/bin/htmlproofer \
    --assume-extension \
    --check-img-http \
    --internal-domains $DOMAIN .
