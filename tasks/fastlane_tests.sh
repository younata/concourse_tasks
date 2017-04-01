#!/bin/bash -el

cd code
bundle
bundle exec fastlane test
