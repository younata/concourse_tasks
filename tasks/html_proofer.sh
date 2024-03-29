#!/bin/sh -el

export LANG=C.UTF-8
export LANGUAGE=C:en
export LC_ALL=C.UTF-8

directory="."

if [ "$SUBDIRECTORY" != "" ]; then
    directory="$SUBDIRECTORY"
fi

cd code

if [ "$directory" = "." ]; then
    echo "Checking all files in `pwd`"
else
    echo "Checking all files in `pwd`/$directory"
fi

/usr/local/bundle/bin/htmlproofer \
    --assume-extension \
    --check-img-http \
    --enforce-https \
    --only_4xx \
    --http-status-ignore "401,402,403,415" \
    --file-ignore "$FILE_IGNORES" \
    --url-ignore "$URL_IGNORES" \
    --internal-domains "$DOMAIN" "$directory"
