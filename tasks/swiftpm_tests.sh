#!/bin/bash -el

cd code
mv Package.swift .Package.main.swift && cp .Package.test.swift Package.swift
swift build && swift test
