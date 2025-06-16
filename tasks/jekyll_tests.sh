#!/bin/bash -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code
bundle install

bundle exec jekyll build
bundle exec htmlproofer --assume-extension --internal-domains "${DOMAIN}" ./_site
