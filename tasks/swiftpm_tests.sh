#!/bin/bash -el

cd code
mv Package.swift .Package.main.swift && cp .Package.test.swift Package.swift
swift build --clean && swift build && swift test
