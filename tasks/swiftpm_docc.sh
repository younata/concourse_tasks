#!/bin/bash -el

cd code
if [ -f .Package.test.swift ]; then
    mv Package.swift .Package.main.swift && cp .Package.test.swift Package.swift
fi
./script/build_docs
