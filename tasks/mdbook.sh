#!/bin/bash -e

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

cd code

/usr/local/cargo/bin/mdbook build
/usr/local/cargo/bin/mdbook test

if [[ -d book/html ]]; then
    mv -f book/html/* book/
    rm -rf book/html
fi

cd ../

cp -r code/book/* book/

