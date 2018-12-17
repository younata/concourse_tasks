#!/bin/bash -el

cd code

carthage update
swift package update

if git diff-index --quiet HEAD --; then
    return
fi

bundle exec fastlane test
swift test

git add Cartfile.resolved
git add Package.resolved

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

git commit -m "Update dependencies"

set +e

last_tag=$(git describe --abbrev=0 --tags || echo "v0.0.0")

set -e
semver=$(echo ${last_tag} | cut -d "v" -f 2)

../concourse/tasks/increment_semver.sh -p ${semver} > tagfile

cd ../

cp -R code updated_code

