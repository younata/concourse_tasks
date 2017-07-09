#!/bin/bash -el

cd code
bundle install

bundle exec jekyll build -D
bundle exec htmlproofer ./_site
