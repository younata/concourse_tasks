#!/bin/bash -el

pushd concourse
source tasks/increment_semver.sh
popd

pushd code

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

increment_semver ${semver} > tagfile

popd

cp -R code updated_code

