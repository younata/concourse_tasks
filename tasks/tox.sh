#!/bin/bash -el

cd code

pip install tox

tox .
