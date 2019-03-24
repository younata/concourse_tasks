#!/bin/bash -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code

mdbook build
mdbook test

cp book/* ../book/

