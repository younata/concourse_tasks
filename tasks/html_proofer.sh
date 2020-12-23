#!/bin/sh -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

directory="."

if [ "$SUBDIRECTORY" != "" ]; then
    directory="$SUBDIRECTORY"
fi

cd code

echo "Checking all files in $directory"

/usr/local/bundle/bin/htmlproofer \
    --assume-extension \
    --check-img-http \
    --enforce-https \
    --only_4xx \
    --file-ignore "$FILE_IGNORES" \
    --internal-domains $DOMAIN "$directory"
