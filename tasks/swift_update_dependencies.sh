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

