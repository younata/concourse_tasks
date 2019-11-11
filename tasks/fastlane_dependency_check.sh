#!/bin/bash -el

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FASTLANE_SKIP_UPDATE_CHECK=1

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

set +e

last_tag=$(git describe --abbrev=0 --tags || echo "v0.0.0")

set -e
semver=$(echo ${last_tag} | cut -d "v" -f 2)

../concourse/tasks/increment_semver.sh -p ${semver} > tagfile

