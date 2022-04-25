#!/bin/sh

find -name Makefile -delete
find -name "*.so*"  -delete
find -name "ota"    -delete
find -name build -type d -exec rm -r -v {} \;
