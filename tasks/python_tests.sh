#!/bin/bash -el

cd code

pip install -r requirements.txt

invoke test
