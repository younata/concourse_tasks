#!/bin/bash -el

cd code

pip install -r requirements.txt

if command -v invoke >/dev/null 2>&1; then
    echo 'Running `invoke test`'
    invoke test
elif command -v pytest >/dev/null 2>&1; then
    echo 'Running `pytest`'
    pytest
else
    echo 'No supported test runner found (looking for invoke or pytest)'
    exit 1
fi
