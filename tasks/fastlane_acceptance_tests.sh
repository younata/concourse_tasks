#!/bin/bash -el

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export FASTLANE_SKIP_UPDATE_CHECK=1

cd code
bundle
bundle exec fastlane acceptance_test
