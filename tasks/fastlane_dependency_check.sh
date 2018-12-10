#!/bin/bash -el

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

cd code

bundle update
carthage update

if git diff-index --quiet HEAD --; then
    return
fi

bundle exec fastlane test

git add Cartfile.resolved
git add Gemfile.lock

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

git commit -m "Update dependencies"

