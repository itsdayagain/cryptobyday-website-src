#!/bin/sh

./build.sh && cd build-output && git add --all && git commit -m "Deploy" && git push -u origin main && cd ..